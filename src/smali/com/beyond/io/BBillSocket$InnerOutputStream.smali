.class public Lcom/beyond/io/BBillSocket$InnerOutputStream;
.super Ljava/io/OutputStream;
.source "BBillSocket.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/BBillSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InnerOutputStream"
.end annotation


# instance fields
.field protected out:Ljava/io/OutputStream;

.field final synthetic this$0:Lcom/beyond/io/BBillSocket;


# direct methods
.method public constructor <init>(Lcom/beyond/io/BBillSocket;)V
    .locals 1

    .prologue
    .line 238
    iput-object p1, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 236
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;

    .line 238
    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 271
    :try_start_0
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 276
    return-void

    .line 272
    :catch_0
    move-exception v0

    .line 273
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 274
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 241
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-static {v2}, Lcom/beyond/io/BBillSocket;->access$0(Lcom/beyond/io/BBillSocket;)Lorg/kwis/msf/io/Socket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-nez v2, :cond_0

    .line 250
    :goto_0
    monitor-exit p0

    return-object v1

    .line 244
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/DataOutputStream;

    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-static {v2}, Lcom/beyond/io/BBillSocket;->access$0(Lcom/beyond/io/BBillSocket;)Lorg/kwis/msf/io/Socket;

    move-result-object v2

    invoke-interface {v2}, Lorg/kwis/msf/io/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, p0

    .line 250
    goto :goto_0

    .line 245
    :catch_0
    move-exception v0

    .line 246
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    iget-object v1, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->this$0:Lcom/beyond/io/BBillSocket;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/beyond/io/BBillSocket;->access$1(Lcom/beyond/io/BBillSocket;Lorg/kwis/msf/io/Socket;)V

    .line 247
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 248
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 241
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public write(I)V
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 285
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/beyond/io/BBillSocket$InnerOutputStream;->write([BII)V

    .line 281
    return-void
.end method

.method public declared-synchronized write([BII)V
    .locals 5
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->this$0:Lcom/beyond/io/BBillSocket;

    invoke-static {v2}, Lcom/beyond/io/BBillSocket;->access$2(Lcom/beyond/io/BBillSocket;)Lcom/beyond/io/BillHeader;

    move-result-object v2

    invoke-virtual {v2, p3}, Lcom/beyond/io/BillHeader;->GetHeader(I)[B

    move-result-object v0

    .line 258
    .local v0, "Headerbuf":[B
    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;

    const/4 v3, 0x0

    const/16 v4, 0x6c

    invoke-virtual {v2, v0, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 262
    iget-object v2, p0, Lcom/beyond/io/BBillSocket$InnerOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    monitor-exit p0

    return-void

    .line 263
    .end local v0    # "Headerbuf":[B
    :catch_0
    move-exception v1

    .line 264
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 265
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 257
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method
