.class Lcom/beyond/io/http$BufferedInputStream;
.super Lcom/beyond/io/http$FilterInputStream;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BufferedInputStream"
.end annotation


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x5b4


# instance fields
.field protected buf:[B

.field protected count:I

.field protected marklimit:I

.field protected markpos:I

.field protected pos:I

.field final synthetic this$0:Lcom/beyond/io/http;


# direct methods
.method public constructor <init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V
    .locals 1
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1359
    const/16 v0, 0x5b4

    invoke-direct {p0, p1, p2, v0}, Lcom/beyond/io/http$BufferedInputStream;-><init>(Lcom/beyond/io/http;Ljava/io/InputStream;I)V

    .line 1360
    return-void
.end method

.method public constructor <init>(Lcom/beyond/io/http;Ljava/io/InputStream;I)V
    .locals 2
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "bufsize"    # I

    .prologue
    .line 1368
    iput-object p1, p0, Lcom/beyond/io/http$BufferedInputStream;->this$0:Lcom/beyond/io/http;

    .line 1369
    invoke-direct {p0, p1, p2}, Lcom/beyond/io/http$FilterInputStream;-><init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V

    .line 1346
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    .line 1370
    if-gtz p3, :cond_0

    .line 1371
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "buffer size <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1373
    :cond_0
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    .line 1374
    return-void
.end method

.method private refillBuffer(I)V
    .locals 7
    .param p1, "bytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 1548
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V

    .line 1549
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    if-eq v1, v2, :cond_0

    .line 1550
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "pos != count"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1553
    :cond_0
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    if-ltz v1, :cond_1

    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget-object v2, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    array-length v2, v2

    if-lt v1, v2, :cond_4

    .line 1554
    :cond_1
    iput v6, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    .line 1555
    iput v6, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    .line 1556
    const/4 v1, -0x1

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    .line 1565
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->in:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v3, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget-object v4, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    array-length v4, v4

    iget v5, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    sub-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 1566
    .local v0, "len":I
    if-lez v0, :cond_3

    .line 1567
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    .line 1569
    :cond_3
    return-void

    .line 1558
    .end local v0    # "len":I
    :cond_4
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    if-lez v1, :cond_2

    .line 1559
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    iget-object v3, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v4, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v5, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    sub-int/2addr v4, v5

    invoke-static {v1, v2, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1560
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    .line 1561
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    .line 1562
    iput v6, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    goto :goto_0
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
    .line 1448
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V

    .line 1449
    iget v0, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1382
    invoke-super {p0}, Lcom/beyond/io/http$FilterInputStream;->close()V

    .line 1383
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    .line 1384
    return-void
.end method

.method public declared-synchronized mark(I)V
    .locals 5
    .param p1, "readlimit"    # I

    .prologue
    .line 1399
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->chkOpen()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-nez v1, :cond_0

    .line 1410
    :goto_0
    monitor-exit p0

    return-void

    .line 1401
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    array-length v1, v1

    if-ge v1, p1, :cond_1

    .line 1402
    new-array v0, p1, [B

    .line 1403
    .local v0, "newBuf":[B
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    .line 1404
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    const/4 v3, 0x0

    iget v4, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1405
    iput-object v0, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    .line 1406
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    .line 1408
    .end local v0    # "newBuf":[B
    :cond_1
    iput p1, p0, Lcom/beyond/io/http$BufferedInputStream;->marklimit:I

    .line 1409
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1399
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 1421
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1491
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V

    .line 1492
    iget v0, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    if-ne v0, v1, :cond_0

    .line 1493
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/beyond/io/http$BufferedInputStream;->refillBuffer(I)V

    .line 1495
    iget v0, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    .line 1496
    const/4 v0, -0x1

    .line 1500
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    aget-byte v0, v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    and-int/lit16 v0, v0, 0xff

    goto :goto_0

    .line 1491
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized read([BII)I
    .locals 3
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1519
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1520
    if-nez p3, :cond_0

    .line 1521
    const/4 p3, 0x0

    .line 1543
    .end local p3    # "len":I
    :goto_0
    monitor-exit p0

    return p3

    .line 1524
    .restart local p3    # "len":I
    :cond_0
    :try_start_1
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    if-ne v1, v2, :cond_2

    .line 1525
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    array-length v1, v1

    if-lt p3, v1, :cond_1

    .line 1526
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p3

    goto :goto_0

    .line 1528
    :cond_1
    invoke-direct {p0, p3}, Lcom/beyond/io/http$BufferedInputStream;->refillBuffer(I)V

    .line 1529
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    if-ne v1, v2, :cond_2

    .line 1530
    const/4 p3, -0x1

    goto :goto_0

    .line 1534
    :cond_2
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    sub-int v0, v1, v2

    .line 1535
    .local v0, "available":I
    if-gt p3, v0, :cond_3

    .line 1536
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    invoke-static {v1, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1537
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    add-int/2addr v1, p3

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1519
    .end local v0    # "available":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 1541
    .restart local v0    # "available":I
    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->buf:[B

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1542
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move p3, v0

    .line 1543
    goto :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1431
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V

    .line 1432
    iget v0, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    if-gez v0, :cond_0

    .line 1433
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream not marked"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1431
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1436
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/beyond/io/http$BufferedInputStream;->markpos:I

    iput v0, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1437
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized skip(J)J
    .locals 4
    .param p1, "bytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v1, 0x0

    .line 1463
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$BufferedInputStream;->ensureOpen()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1464
    cmp-long v3, p1, v1

    if-gtz v3, :cond_0

    .line 1476
    :goto_0
    monitor-exit p0

    return-wide v1

    .line 1468
    :cond_0
    :try_start_1
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    if-le v1, v2, :cond_1

    .line 1469
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iget v2, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    sub-int v0, v1, v2

    .line 1470
    .local v0, "len":I
    iget v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    .line 1471
    int-to-long v1, v0

    goto :goto_0

    .line 1474
    .end local v0    # "len":I
    :cond_1
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->pos:I

    .line 1475
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/io/http$BufferedInputStream;->count:I

    .line 1476
    iget-object v1, p0, Lcom/beyond/io/http$BufferedInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2}, Ljava/io/InputStream;->skip(J)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v1

    goto :goto_0

    .line 1463
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
