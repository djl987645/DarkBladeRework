.class Lcom/beyond/io/InnerSerialInputStream;
.super Ljava/io/InputStream;
.source "comm.java"


# instance fields
.field eof:Z

.field oneByte:[B

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
    .line 232
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 229
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/InnerSerialInputStream;->eof:Z

    .line 230
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->oneByte:[B

    .line 233
    iput-object p1, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    .line 234
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-virtual {p0}, Lcom/beyond/io/InnerSerialInputStream;->ensureOpen()V

    .line 285
    iget-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    iget-object v1, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    iget v1, v1, Lcom/beyond/io/comm;->fd:I

    invoke-virtual {v0, v1}, Lcom/beyond/io/comm;->SIOAvailable0(I)I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {p0}, Lcom/beyond/io/InnerSerialInputStream;->ensureOpen()V

    .line 291
    iget-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    invoke-virtual {v0}, Lcom/beyond/io/comm;->realClose()V

    .line 292
    iget-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/beyond/io/comm;->isopen:Z

    .line 293
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    .line 295
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
    .line 237
    iget-object v0, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    if-nez v0, :cond_0

    .line 238
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 240
    :cond_0
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 243
    iget-object v1, p0, Lcom/beyond/io/InnerSerialInputStream;->oneByte:[B

    invoke-virtual {p0, v1, v2, v3}, Lcom/beyond/io/InnerSerialInputStream;->read([BII)I

    move-result v0

    .line 244
    .local v0, "ret":I
    if-eq v0, v3, :cond_0

    .line 245
    const/4 v1, -0x1

    .line 247
    :goto_0
    return v1

    :cond_0
    iget-object v1, p0, Lcom/beyond/io/InnerSerialInputStream;->oneByte:[B

    aget-byte v1, v1, v2

    and-int/lit16 v1, v1, 0xff

    goto :goto_0
.end method

.method public declared-synchronized read([BII)I
    .locals 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 251
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/InnerSerialInputStream;->ensureOpen()V

    .line 252
    iget-boolean v3, p0, Lcom/beyond/io/InnerSerialInputStream;->eof:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    move v1, v2

    .line 280
    :cond_0
    :goto_0
    monitor-exit p0

    return v1

    .line 255
    :cond_1
    if-nez p1, :cond_2

    .line 256
    :try_start_1
    new-instance v2, Ljava/lang/NullPointerException;

    invoke-direct {v2}, Ljava/lang/NullPointerException;-><init>()V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 251
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 258
    :cond_2
    if-nez p3, :cond_3

    .line 259
    const/4 v1, 0x0

    goto :goto_0

    .line 261
    :cond_3
    const/4 v1, 0x0

    .line 262
    .local v1, "n":I
    :goto_1
    if-lt v1, p3, :cond_5

    .line 277
    :cond_4
    :goto_2
    :try_start_2
    iget-object v2, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    if-nez v2, :cond_0

    .line 278
    new-instance v2, Ljava/io/InterruptedIOException;

    invoke-direct {v2}, Ljava/io/InterruptedIOException;-><init>()V

    throw v2

    .line 263
    :cond_5
    iget-object v3, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    iget-object v4, p0, Lcom/beyond/io/InnerSerialInputStream;->parent:Lcom/beyond/io/comm;

    iget v4, v4, Lcom/beyond/io/comm;->fd:I

    add-int v5, p2, v1

    sub-int v6, p3, v1

    invoke-virtual {v3, v4, p1, v5, v6}, Lcom/beyond/io/comm;->SIOReceive0(I[BII)I

    move-result v0

    .line 264
    .local v0, "count":I
    if-ne v0, v2, :cond_6

    .line 265
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/beyond/io/InnerSerialInputStream;->eof:Z

    .line 266
    if-nez v1, :cond_4

    .line 267
    const/4 v1, -0x1

    .line 269
    goto :goto_2

    .line 271
    :cond_6
    add-int/2addr v1, v0

    .line 272
    if-eq v1, p3, :cond_4

    .line 275
    invoke-static {}, Ljava/lang/Thread;->yield()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method
