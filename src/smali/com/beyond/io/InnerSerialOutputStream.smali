.class Lcom/beyond/io/InnerSerialOutputStream;
.super Ljava/io/OutputStream;
.source "comm.java"


# instance fields
.field one:[B

.field private parent:Lcom/beyond/io/comm;


# direct methods
.method public constructor <init>(Lcom/beyond/io/comm;)V
    .locals 1
    .param p1, "parent"    # Lcom/beyond/io/comm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 300
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->one:[B

    .line 303
    iput-object p1, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    .line 304
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    iget-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    if-eqz v0, :cond_0

    .line 338
    invoke-virtual {p0}, Lcom/beyond/io/InnerSerialOutputStream;->ensureOpen()V

    .line 339
    iget-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    invoke-virtual {v0}, Lcom/beyond/io/comm;->realClose()V

    .line 340
    iget-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/beyond/io/comm;->osopen:Z

    .line 341
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    .line 343
    :cond_0
    return-void
.end method

.method ensureOpen()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    iget-object v0, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    if-nez v0, :cond_0

    .line 308
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 310
    :cond_0
    return-void
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 346
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized write(I)V
    .locals 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/beyond/io/InnerSerialOutputStream;->one:[B

    const/4 v2, 0x0

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 314
    iget-object v1, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    iget-object v2, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    iget v2, v2, Lcom/beyond/io/comm;->fd:I

    iget-object v3, p0, Lcom/beyond/io/InnerSerialOutputStream;->one:[B

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/beyond/io/comm;->SIOTransmit0(I[BII)I

    move-result v0

    .line 315
    .local v0, "error":I
    if-gez v0, :cond_0

    .line 316
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Serial Device Write Error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 313
    .end local v0    # "error":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 318
    .restart local v0    # "error":I
    :cond_0
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized write([BII)V
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/InnerSerialOutputStream;->ensureOpen()V

    .line 322
    if-nez p1, :cond_0

    .line 323
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1}, Ljava/lang/NullPointerException;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 326
    :cond_0
    if-nez p3, :cond_2

    .line 334
    :cond_1
    monitor-exit p0

    return-void

    .line 330
    :cond_2
    :try_start_1
    iget-object v1, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    iget-object v2, p0, Lcom/beyond/io/InnerSerialOutputStream;->parent:Lcom/beyond/io/comm;

    iget v2, v2, Lcom/beyond/io/comm;->fd:I

    invoke-virtual {v1, v2, p1, p2, p3}, Lcom/beyond/io/comm;->SIOTransmit0(I[BII)I

    move-result v0

    .line 331
    .local v0, "error":I
    if-gez v0, :cond_1

    .line 332
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Serial Device Write Error"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
.end method
