.class public Lcom/beyond/io/socket;
.super Lcom/beyond/io/SocketModel;
.source "socket.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# static fields
.field static final READ:I = 0x1

.field static final WRITE:I = 0x2


# instance fields
.field derivedcnt:I

.field private fd:I

.field inopened:Z

.field private mSock:Ljava/net/Socket;

.field private mode:I

.field private opened:Z

.field outopened:Z

.field private peerAddr:Ljava/lang/String;

.field private remoteip:I

.field private remoteport:S

.field private timeout:I


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 16
    iput v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    .line 17
    iput v1, p0, Lcom/beyond/io/socket;->mode:I

    .line 18
    iput v0, p0, Lcom/beyond/io/socket;->timeout:I

    .line 20
    iput-object v2, p0, Lcom/beyond/io/socket;->peerAddr:Ljava/lang/String;

    .line 21
    iput v1, p0, Lcom/beyond/io/socket;->remoteip:I

    .line 22
    iput-short v0, p0, Lcom/beyond/io/socket;->remoteport:S

    .line 24
    iput-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    .line 25
    iput-boolean v0, p0, Lcom/beyond/io/socket;->inopened:Z

    .line 26
    iput-boolean v0, p0, Lcom/beyond/io/socket;->outopened:Z

    .line 32
    iput-object v2, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    .line 43
    return-void
.end method

.method constructor <init>(IIIZIS)V
    .locals 3
    .param p1, "fd"    # I
    .param p2, "mode"    # I
    .param p3, "timeout"    # I
    .param p4, "wire"    # Z
    .param p5, "remoteip"    # I
    .param p6, "remoteport"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 16
    iput v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    .line 17
    iput v1, p0, Lcom/beyond/io/socket;->mode:I

    .line 18
    iput v0, p0, Lcom/beyond/io/socket;->timeout:I

    .line 20
    iput-object v2, p0, Lcom/beyond/io/socket;->peerAddr:Ljava/lang/String;

    .line 21
    iput v1, p0, Lcom/beyond/io/socket;->remoteip:I

    .line 22
    iput-short v0, p0, Lcom/beyond/io/socket;->remoteport:S

    .line 24
    iput-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    .line 25
    iput-boolean v0, p0, Lcom/beyond/io/socket;->inopened:Z

    .line 26
    iput-boolean v0, p0, Lcom/beyond/io/socket;->outopened:Z

    .line 32
    iput-object v2, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    .line 36
    iput p1, p0, Lcom/beyond/io/socket;->fd:I

    .line 37
    iput p5, p0, Lcom/beyond/io/socket;->remoteip:I

    .line 38
    iput-short p6, p0, Lcom/beyond/io/socket;->remoteport:S

    .line 39
    invoke-virtual {p0, p1, p2, p3}, Lcom/beyond/io/socket;->open(III)V

    .line 40
    return-void
.end method

.method private bytesToInt([BI)I
    .locals 3
    .param p1, "bytes"    # [B
    .param p2, "start"    # I

    .prologue
    .line 372
    add-int/lit8 v1, p2, 0x3

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x2

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    .line 373
    add-int/lit8 v2, p2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    .line 372
    or-int/2addr v1, v2

    .line 373
    aget-byte v2, p1, p2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x18

    .line 372
    or-int v0, v1, v2

    .line 374
    .local v0, "value":I
    return v0
.end method

.method private checkOpened()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 202
    iget-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    if-nez v0, :cond_0

    .line 203
    new-instance v0, Ljava/io/IOException;

    const-string v1, "already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 204
    :cond_0
    return-void
.end method

.method private getHost0(IZ)I
    .locals 3
    .param p1, "fd"    # I
    .param p2, "local"    # Z

    .prologue
    .line 355
    const/4 v0, 0x0

    .line 356
    .local v0, "addr":Ljava/net/InetAddress;
    if-eqz p2, :cond_0

    .line 357
    iget-object v1, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 361
    :goto_0
    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/beyond/io/socket;->bytesToInt([BI)I

    move-result v1

    return v1

    .line 359
    :cond_0
    iget-object v1, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    goto :goto_0
.end method

.method private getPort0(IZ)I
    .locals 1
    .param p1, "fd"    # I
    .param p2, "local"    # Z

    .prologue
    .line 348
    if-eqz p2, :cond_0

    .line 349
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v0

    .line 351
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v0

    goto :goto_0
.end method

.method private native getSockOpt0(II)I
.end method

.method private native setSockOpt0(III)V
.end method

.method private sockclose(I)V
    .locals 1
    .param p1, "fd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 344
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    .line 345
    return-void
.end method

.method private sockopen(Ljava/net/InetSocketAddress;I)I
    .locals 1
    .param p1, "remoteAddr"    # Ljava/net/InetSocketAddress;
    .param p2, "timeouts"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 336
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    if-nez v0, :cond_0

    .line 337
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    .line 338
    :cond_0
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v0, p1, p2}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V

    .line 339
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method private toInt(Ljava/lang/String;ILjava/lang/String;)I
    .locals 3
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "radix"    # I
    .param p3, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v1, 0x0

    .line 49
    .local v1, "val":I
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 53
    return v1

    .line 50
    :catch_0
    move-exception v0

    .line 51
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public checkOpenedSocket()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    iget-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    if-nez v0, :cond_0

    .line 210
    new-instance v0, Ljava/io/IOException;

    const-string v1, "already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 211
    :cond_0
    return-void
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    if-eqz v0, :cond_0

    .line 250
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    .line 251
    invoke-virtual {p0}, Lcom/beyond/io/socket;->realClose()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    :cond_0
    monitor-exit p0

    return-void

    .line 249
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 217
    iget v1, p0, Lcom/beyond/io/socket;->mode:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_0

    .line 218
    new-instance v1, Ljava/io/IOException;

    const-string v2, "read access denied"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 220
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lcom/beyond/io/socket;->inopened:Z

    if-eqz v1, :cond_1

    .line 221
    new-instance v1, Ljava/io/IOException;

    const-string v2, "input stream already opened"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 224
    :cond_1
    iget-object v1, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 225
    .local v0, "in":Ljava/io/InputStream;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/io/socket;->inopened:Z

    .line 226
    iget v1, p0, Lcom/beyond/io/socket;->derivedcnt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/beyond/io/socket;->derivedcnt:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 227
    monitor-exit p0

    return-object v0
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 293
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 294
    iget v2, p0, Lcom/beyond/io/socket;->fd:I

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/beyond/io/socket;->getHost0(IZ)I

    move-result v1

    .line 296
    .local v1, "ret":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 298
    new-instance v2, Ljava/io/IOException;

    const-string v3, "fail to get Local Address"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 300
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    shr-int/lit8 v3, v1, 0x18

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 302
    shr-int/lit8 v3, v1, 0x10

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 303
    shr-int/lit8 v3, v1, 0x8

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 304
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 300
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "localAddress":Ljava/lang/String;
    return-object v0
.end method

.method public getLocalPort()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 314
    iget v0, p0, Lcom/beyond/io/socket;->fd:I

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/beyond/io/socket;->getPort0(IZ)I

    move-result v0

    return v0
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 232
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 234
    iget v1, p0, Lcom/beyond/io/socket;->mode:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_0

    .line 235
    new-instance v1, Ljava/io/IOException;

    const-string v2, "write access denied"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 237
    :cond_0
    :try_start_1
    iget-boolean v1, p0, Lcom/beyond/io/socket;->outopened:Z

    if-eqz v1, :cond_1

    .line 238
    new-instance v1, Ljava/io/IOException;

    const-string v2, "output stream already opened"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_1
    iget-object v1, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 242
    .local v0, "out":Ljava/io/OutputStream;
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/beyond/io/socket;->outopened:Z

    .line 243
    iget v1, p0, Lcom/beyond/io/socket;->derivedcnt:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/beyond/io/socket;->derivedcnt:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 244
    monitor-exit p0

    return-object v0
.end method

.method public getPeerAddress()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 268
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 270
    iget v2, p0, Lcom/beyond/io/socket;->fd:I

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/beyond/io/socket;->getHost0(IZ)I

    move-result v1

    .line 274
    .local v1, "ret":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    if-nez v1, :cond_1

    .line 275
    :cond_0
    new-instance v2, Ljava/io/IOException;

    const-string v3, "fail to get remote Address"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 277
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 278
    shr-int/lit8 v3, v1, 0x18

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 279
    shr-int/lit8 v3, v1, 0x10

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 280
    shr-int/lit8 v3, v1, 0x8

    and-int/lit16 v3, v3, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 281
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 277
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 283
    .local v0, "remoteAddress":Ljava/lang/String;
    return-object v0
.end method

.method public getPeerPort()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 289
    iget v0, p0, Lcom/beyond/io/socket;->fd:I

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/beyond/io/socket;->getPort0(IZ)I

    move-result v0

    return v0
.end method

.method public getSocketOpt(Lorg/kwis/msf/io/Socket;B)I
    .locals 1
    .param p1, "socket"    # Lorg/kwis/msf/io/Socket;
    .param p2, "option"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 264
    iget v0, p0, Lcom/beyond/io/socket;->fd:I

    invoke-direct {p0, v0, p2}, Lcom/beyond/io/socket;->getSockOpt0(II)I

    move-result v0

    return v0
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 326
    const/4 v0, 0x1

    return v0
.end method

.method public open(III)V
    .locals 2
    .param p1, "fd"    # I
    .param p2, "mode"    # I
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    if-eqz v0, :cond_0

    .line 172
    new-instance v0, Ljava/io/IOException;

    const-string v1, "connection is already opened"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_0
    iput p1, p0, Lcom/beyond/io/socket;->fd:I

    .line 175
    iput p2, p0, Lcom/beyond/io/socket;->mode:I

    .line 176
    iput p3, p0, Lcom/beyond/io/socket;->timeout:I

    .line 177
    iget v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/socket;->opened:Z

    .line 179
    iget-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    if-nez v0, :cond_1

    .line 180
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0}, Ljava/net/Socket;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/socket;->mSock:Ljava/net/Socket;

    .line 181
    :cond_1
    return-void
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 14
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v11, 0x0

    :try_start_0
    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2f

    if-ne v11, v12, :cond_0

    const/4 v11, 0x1

    invoke-virtual {p1, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x2f

    if-eq v11, v12, :cond_1

    .line 76
    :cond_0
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "bad URI: \"//\" omitted"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    :catch_0
    move-exception v3

    .line 78
    .local v3, "e":Ljava/lang/Exception;
    new-instance v11, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 82
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 83
    .local v5, "len":I
    const/16 v11, 0x3a

    invoke-virtual {p1, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 84
    .local v4, "idx":I
    if-lez v4, :cond_2

    .line 87
    :cond_2
    const/16 v11, 0x3a

    invoke-virtual {p1, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 88
    .local v6, "ndx":I
    const/4 v11, -0x1

    if-ne v6, v11, :cond_3

    .line 89
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "bad URI: \':\' expected before port"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 91
    :cond_3
    add-int/lit8 v11, v6, 0x1

    invoke-virtual {p1, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    .line 94
    .local v8, "portstr":Ljava/lang/String;
    const/16 v11, 0x2f

    invoke-virtual {v8, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 95
    const/4 v11, -0x1

    if-eq v4, v11, :cond_9

    .line 96
    add-int/lit8 v11, v4, 0x1

    invoke-virtual {v8, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 97
    .local v9, "str":Ljava/lang/String;
    const/16 v11, 0xa

    const-string v12, "bad URI: bad timeout"

    invoke-direct {p0, v9, v11, v12}, Lcom/beyond/io/socket;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v10

    .line 98
    .local v10, "timeouts":I
    const/4 v11, 0x0

    invoke-virtual {v8, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 101
    const/16 v11, 0x2f

    invoke-virtual {v8, v11}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 102
    const/4 v11, -0x1

    if-ne v4, v11, :cond_4

    .line 103
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "bad URI: no mode"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 105
    :cond_4
    add-int/lit8 v11, v4, 0x1

    invoke-virtual {v8, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 106
    const-string v11, "r"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 107
    const/4 v11, 0x1

    iput v11, p0, Lcom/beyond/io/socket;->mode:I

    .line 115
    :goto_0
    const/4 v11, 0x0

    invoke-virtual {v8, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 122
    .end local v9    # "str":Ljava/lang/String;
    :goto_1
    const/16 v11, 0xa

    const-string v12, "bad URI: no decimal port"

    invoke-direct {p0, v8, v11, v12}, Lcom/beyond/io/socket;->toInt(Ljava/lang/String;ILjava/lang/String;)I

    move-result v7

    .line 127
    .local v7, "port":I
    const/16 v11, 0x3a

    invoke-virtual {p1, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    const/4 v12, 0x2

    if-ne v11, v12, :cond_a

    .line 129
    new-instance v2, Lcom/beyond/io/serversocket;

    const/4 v11, 0x0

    invoke-direct {v2, v11}, Lcom/beyond/io/serversocket;-><init>(Z)V

    .line 131
    .local v2, "con":Lcom/beyond/io/serversocket;
    if-gez v7, :cond_5

    .line 133
    const/4 v7, 0x0

    .line 135
    :cond_5
    iget v11, p0, Lcom/beyond/io/socket;->mode:I

    invoke-virtual {v2, v7, v11, v10}, Lcom/beyond/io/serversocket;->open(III)V

    .line 164
    .end local v2    # "con":Lcom/beyond/io/serversocket;
    :goto_2
    return-object v2

    .line 108
    .end local v7    # "port":I
    .restart local v9    # "str":Ljava/lang/String;
    :cond_6
    const-string v11, "w"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 109
    const/4 v11, 0x2

    iput v11, p0, Lcom/beyond/io/socket;->mode:I

    goto :goto_0

    .line 110
    :cond_7
    const-string v11, "rw"

    invoke-virtual {v9, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 111
    const/4 v11, 0x3

    iput v11, p0, Lcom/beyond/io/socket;->mode:I

    goto :goto_0

    .line 113
    :cond_8
    new-instance v11, Ljava/lang/IllegalArgumentException;

    const-string v12, "bad URI: bad mode"

    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 118
    .end local v9    # "str":Ljava/lang/String;
    .end local v10    # "timeouts":I
    :cond_9
    const/4 v11, 0x3

    iput v11, p0, Lcom/beyond/io/socket;->mode:I

    .line 119
    const/4 v10, 0x0

    .restart local v10    # "timeouts":I
    goto :goto_1

    .line 139
    .restart local v7    # "port":I
    :cond_a
    const/4 v11, 0x2

    const/16 v12, 0x3a

    invoke-virtual {p1, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    invoke-virtual {p1, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "address":Ljava/lang/String;
    if-gtz v7, :cond_b

    .line 141
    new-instance v11, Ljava/lang/IllegalArgumentException;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "bad URI: bad port number "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 141
    invoke-direct {v11, v12}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 146
    :cond_b
    :try_start_1
    new-instance v0, Ljava/net/InetSocketAddress;

    invoke-direct {v0, v1, v7}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 148
    .local v0, "addr":Ljava/net/InetSocketAddress;
    invoke-direct {p0, v0, v10}, Lcom/beyond/io/socket;->sockopen(Ljava/net/InetSocketAddress;I)I

    move-result v11

    iput v11, p0, Lcom/beyond/io/socket;->fd:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 161
    iput-object v1, p0, Lcom/beyond/io/socket;->peerAddr:Ljava/lang/String;

    .line 162
    iget v11, p0, Lcom/beyond/io/socket;->fd:I

    iget v12, p0, Lcom/beyond/io/socket;->mode:I

    iget v13, p0, Lcom/beyond/io/socket;->timeout:I

    invoke-virtual {p0, v11, v12, v13}, Lcom/beyond/io/socket;->open(III)V

    move-object v2, p0

    .line 164
    goto :goto_2

    .line 152
    .end local v0    # "addr":Ljava/net/InetSocketAddress;
    :catch_1
    move-exception v3

    .line 153
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 154
    new-instance v11, Ljava/io/IOException;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "cannot connect to "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 156
    .end local v3    # "e":Ljava/io/IOException;
    :catch_2
    move-exception v3

    .line 157
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 158
    new-instance v11, Ljava/io/IOException;

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v13, "cannot connect to "

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ":"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v11
.end method

.method protected declared-synchronized realClose()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/beyond/io/socket;->derivedcnt:I

    if-nez v0, :cond_0

    .line 319
    iget v0, p0, Lcom/beyond/io/socket;->fd:I

    invoke-direct {p0, v0}, Lcom/beyond/io/socket;->sockclose(I)V

    .line 320
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/socket;->fd:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 322
    :cond_0
    monitor-exit p0

    return-void

    .line 318
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setSocketOpt(Lorg/kwis/msf/io/Socket;BI)V
    .locals 1
    .param p1, "socket"    # Lorg/kwis/msf/io/Socket;
    .param p2, "option"    # B
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    invoke-direct {p0}, Lcom/beyond/io/socket;->checkOpened()V

    .line 258
    iget v0, p0, Lcom/beyond/io/socket;->fd:I

    invoke-direct {p0, v0, p2, p3}, Lcom/beyond/io/socket;->setSockOpt0(III)V

    .line 259
    return-void
.end method
