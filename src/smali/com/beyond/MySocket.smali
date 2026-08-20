.class Lcom/beyond/MySocket;
.super Ljava/lang/Object;
.source "MySocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final MH_NETEV_NETWORK_CLOSE:I = 0x2

.field public static final MH_NETEV_NETWORK_OEMCLOSE:I = 0x80

.field public static final MH_NETEV_NETWORK_OEMOPEN:I = 0x40

.field public static final MH_NETEV_NETWORK_OEMRELEASE:I = 0x200

.field public static final MH_NETEV_NETWORK_OEMSHARE:I = 0x100

.field public static final MH_NETEV_NETWORK_OPEN:I = 0x1

.field public static final MH_NETEV_SOCKET_CLOSE:I = 0x8

.field public static final MH_NETEV_SOCKET_CONNECT:I = 0x4

.field public static final MH_NETEV_SOCKET_READ:I = 0x10

.field public static final MH_NETEV_SOCKET_WRITE:I = 0x20

.field public static final SOCKET_STATUS_CLOSED:I = 0x0

.field public static final SOCKET_STATUS_CONNECTED:I = 0x2

.field public static final SOCKET_STATUS_ERROR:I = -0x1

.field public static final SOCKET_STATUS_OPENING:I = 0x1


# instance fields
.field public CBconnect:I

.field public CBread:I

.field public CBwrite:I

.field public count:I

.field public cs:Ljava/net/Socket;

.field public dcs:Ljava/net/DatagramSocket;

.field inByte:Ljava/io/ByteArrayInputStream;

.field public ios:[B

.field public ip:Ljava/lang/String;

.field public isConnected:Z

.field isReadable:Z

.field outByte:Ljava/io/ByteArrayOutputStream;

.field public param:I

.field public port:I

.field public status:I

.field thread:Ljava/lang/Thread;

.field public type:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object v1, p0, Lcom/beyond/MySocket;->thread:Ljava/lang/Thread;

    .line 47
    iput-object v1, p0, Lcom/beyond/MySocket;->inByte:Ljava/io/ByteArrayInputStream;

    .line 48
    iput-object v1, p0, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    .line 49
    iput v0, p0, Lcom/beyond/MySocket;->CBconnect:I

    .line 50
    iput v0, p0, Lcom/beyond/MySocket;->CBread:I

    .line 51
    iput v0, p0, Lcom/beyond/MySocket;->CBwrite:I

    .line 52
    iput v0, p0, Lcom/beyond/MySocket;->param:I

    .line 53
    iput v0, p0, Lcom/beyond/MySocket;->port:I

    .line 54
    iput-object v1, p0, Lcom/beyond/MySocket;->ip:Ljava/lang/String;

    .line 55
    iput v0, p0, Lcom/beyond/MySocket;->count:I

    .line 56
    iput v2, p0, Lcom/beyond/MySocket;->type:I

    .line 57
    iput v0, p0, Lcom/beyond/MySocket;->status:I

    .line 58
    iput-boolean v0, p0, Lcom/beyond/MySocket;->isConnected:Z

    .line 65
    iput-object v1, p0, Lcom/beyond/MySocket;->ios:[B

    .line 188
    iput-boolean v2, p0, Lcom/beyond/MySocket;->isReadable:Z

    .line 68
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    .line 69
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 164
    iget-object v1, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v1, :cond_0

    .line 166
    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v1}, Lcom/beyond/MySocket;->setStatus(I)V

    .line 175
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/beyond/MySocket;->isReadable:Z

    .line 176
    iget-object v1, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 177
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    .line 178
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/beyond/MySocket;->isReadable:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 179
    :catch_0
    move-exception v0

    .line 181
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 182
    const-string v1, "ERROR"

    const-string v2, "ERROR MySock.closed"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    iput-boolean v3, p0, Lcom/beyond/MySocket;->isReadable:Z

    goto :goto_0
.end method

.method public connect(Ljava/lang/String;I)V
    .locals 4
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 127
    const-string v1, "SOCKET"

    const-string v2, "connect():"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    iget v1, p0, Lcom/beyond/MySocket;->status:I

    if-eqz v1, :cond_0

    .line 130
    const-string v1, "ERROR"

    const-string v2, "MySocket::connect(): SOCKET_STATUS_CLOSED"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :goto_0
    return-void

    .line 135
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/beyond/MySocket;->thread:Ljava/lang/Thread;

    .line 136
    iget-object v1, p0, Lcom/beyond/MySocket;->thread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 138
    iput-object p1, p0, Lcom/beyond/MySocket;->ip:Ljava/lang/String;

    .line 139
    iput p2, p0, Lcom/beyond/MySocket;->port:I

    .line 141
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/beyond/MySocket;->setStatus(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 153
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "ERROR"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "connect(): error"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public connection()V
    .locals 4

    .prologue
    .line 110
    iget v1, p0, Lcom/beyond/MySocket;->status:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v1, :cond_1

    .line 124
    :cond_0
    :goto_0
    return-void

    .line 113
    :cond_1
    :try_start_0
    const-string v1, "SOCKET"

    const-string v2, "run start socket connection!!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    new-instance v1, Ljava/net/Socket;

    iget-object v2, p0, Lcom/beyond/MySocket;->ip:Ljava/lang/String;

    iget v3, p0, Lcom/beyond/MySocket;->port:I

    invoke-direct {v1, v2, v3}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 117
    :catch_0
    move-exception v0

    .line 119
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "0ERROR"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "=========Err : "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 121
    const-string v1, "!!connection error"

    invoke-static {v1}, Lcom/beyond/BeyondActivity;->toShowToast(Ljava/lang/String;)V

    .line 122
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Lcom/beyond/MySocket;->setStatus(I)V

    goto :goto_0
.end method

.method public run()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x8

    .line 190
    const-string v3, "SOCKET"

    const-string v4, "run start"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    :try_start_0
    new-instance v3, Ljava/net/Socket;

    iget-object v4, p0, Lcom/beyond/MySocket;->ip:Ljava/lang/String;

    iget v5, p0, Lcom/beyond/MySocket;->port:I

    invoke-direct {v3, v4, v5}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    :goto_0
    :pswitch_0
    :try_start_1
    iget-boolean v3, p0, Lcom/beyond/MySocket;->isReadable:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_1

    .line 298
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v3, :cond_0

    .line 300
    invoke-virtual {p0}, Lcom/beyond/MySocket;->close()V

    .line 301
    iput-object v7, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    .line 302
    iget v3, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-static {v6, v3}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    .line 305
    :cond_0
    :goto_1
    return-void

    .line 193
    :catch_0
    move-exception v1

    .line 195
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "=========Err : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 202
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_2
    iget v3, p0, Lcom/beyond/MySocket;->status:I

    packed-switch v3, :pswitch_data_0

    :pswitch_1
    goto :goto_0

    .line 206
    :pswitch_2
    const-string v3, "SOCKET"

    const-string v4, "run start socket opening"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget v3, p0, Lcom/beyond/MySocket;->count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/beyond/MySocket;->count:I

    .line 208
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v3, :cond_2

    .line 210
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 212
    const-string v3, "SOCKET"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "run start socket connected "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/beyond/MySocket;->CBconnect:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 213
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lcom/beyond/MySocket;->setStatus(I)V

    .line 214
    const/4 v3, 0x4

    iget v4, p0, Lcom/beyond/MySocket;->CBconnect:I

    invoke-static {v3, v4}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    .line 215
    const/4 v3, 0x0

    iput v3, p0, Lcom/beyond/MySocket;->param:I

    .line 216
    const/4 v3, 0x0

    iput v3, p0, Lcom/beyond/MySocket;->CBconnect:I

    .line 221
    :cond_2
    const-wide/16 v3, 0x64

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 290
    :catch_1
    move-exception v1

    .line 293
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_3
    const-string v3, "ERROR"

    const-string v4, "MYSOCK.run() SOCKET CLOSED!!"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 298
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v3, :cond_0

    .line 300
    invoke-virtual {p0}, Lcom/beyond/MySocket;->close()V

    .line 301
    iput-object v7, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    .line 302
    iget v3, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-static {v6, v3}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    goto :goto_1

    .line 230
    .end local v1    # "e":Ljava/lang/Exception;
    :pswitch_3
    :try_start_4
    const-string v3, "SOCKET"

    const-string v4, "MYSOCK.run()>> CBread START"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    const/4 v2, -0x1

    .line 233
    .local v2, "i":I
    const/16 v3, 0x400

    new-array v0, v3, [B

    .line 234
    .local v0, "buf":[B
    const/16 v3, 0x400

    new-array v0, v3, [B
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 238
    :try_start_5
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result v2

    .line 247
    :goto_2
    :try_start_6
    const-string v3, "SOCKET"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.run()>> CBread END"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 251
    if-lez v2, :cond_4

    .line 254
    :try_start_7
    iget-object v3, p0, Lcom/beyond/MySocket;->outByte:Ljava/io/ByteArrayOutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 257
    const-string v3, "SOCKET"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.run()>> CBread outByte.wirte:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 274
    :goto_3
    :try_start_8
    iget v3, p0, Lcom/beyond/MySocket;->CBread:I

    if-eqz v3, :cond_5

    if-ltz v2, :cond_5

    .line 276
    const-string v3, "SOCKET"

    const-string v4, "MYSOCK.run()>> BhandleNetEvent call"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    const/16 v3, 0x10

    iget v4, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-static {v3, v4}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    .line 284
    :goto_4
    const-wide/16 v3, 0x64

    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_0

    .line 297
    .end local v0    # "buf":[B
    .end local v2    # "i":I
    :catchall_0
    move-exception v3

    .line 298
    iget-object v4, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v4, :cond_3

    .line 300
    invoke-virtual {p0}, Lcom/beyond/MySocket;->close()V

    .line 301
    iput-object v7, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    .line 302
    iget v4, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-static {v6, v4}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    .line 304
    :cond_3
    throw v3

    .line 241
    .restart local v0    # "buf":[B
    .restart local v2    # "i":I
    :catch_2
    move-exception v1

    .line 243
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_9
    const-string v3, "ERROR"

    const-string v4, "MYSOCK.run()>> CBread2 ERROR"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    const-string v3, "ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ERROR : "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2

    .line 258
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v1

    .line 260
    .restart local v1    # "e":Ljava/lang/Exception;
    const-string v3, "ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.run()>> CBread outByte.wirte:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 267
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4
    const-string v3, "ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.run()>> CBread -1 call close_____i = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    invoke-virtual {p0}, Lcom/beyond/MySocket;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 298
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v3, :cond_0

    .line 300
    invoke-virtual {p0}, Lcom/beyond/MySocket;->close()V

    .line 301
    iput-object v7, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    .line 302
    iget v3, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-static {v6, v3}, Lcom/beyond/CletActivity;->handleNetEvent(II)V

    goto/16 :goto_1

    .line 281
    :cond_5
    :try_start_a
    const-string v3, "ERROR"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.run()>> CBread ERROR_____this.CBread = "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/beyond/MySocket;->CBread:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "___________i = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_4

    .line 202
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public setOption(II)V
    .locals 0
    .param p1, "domain"    # I
    .param p2, "type"    # I

    .prologue
    .line 73
    return-void
.end method

.method public setStatus(I)V
    .locals 0
    .param p1, "s"    # I

    .prologue
    .line 77
    iput p1, p0, Lcom/beyond/MySocket;->status:I

    .line 78
    return-void
.end method

.method public write([BII)I
    .locals 6
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v2, -0x1

    .line 82
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    if-eqz v3, :cond_0

    .line 85
    move v1, p3

    .line 90
    .local v1, "l":I
    :try_start_0
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {v3, p1, p2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 91
    iget-object v3, p0, Lcom/beyond/MySocket;->cs:Ljava/net/Socket;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 94
    const-string v3, "SOCKET"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "MYSOCK.write OK:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .end local v1    # "l":I
    :goto_0
    return v1

    .line 97
    .restart local v1    # "l":I
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/String;

    const-string v4, "Write ERROR"

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lcom/beyond/BeyondActivity;->toShowToast(Ljava/lang/String;)V

    move v1, v2

    .line 100
    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "l":I
    :cond_0
    move v1, v2

    .line 103
    goto :goto_0
.end method
