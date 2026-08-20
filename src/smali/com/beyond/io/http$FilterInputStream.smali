.class Lcom/beyond/io/http$FilterInputStream;
.super Ljava/io/InputStream;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterInputStream"
.end annotation


# instance fields
.field protected in:Ljava/io/InputStream;

.field final synthetic this$0:Lcom/beyond/io/http;


# direct methods
.method protected constructor <init>(Lcom/beyond/io/http;Ljava/io/InputStream;)V
    .locals 0
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1585
    iput-object p1, p0, Lcom/beyond/io/http$FilterInputStream;->this$0:Lcom/beyond/io/http;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 1586
    iput-object p2, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    .line 1587
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1654
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1655
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method protected chkOpen()Z
    .locals 1

    .prologue
    .line 1765
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 1766
    const/4 v0, 0x0

    .line 1767
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1754
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    .line 1755
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 1756
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    .line 1758
    :cond_0
    return-void
.end method

.method protected ensureOpen()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1761
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    if-nez v0, :cond_0

    .line 1762
    new-instance v0, Ljava/io/IOException;

    const-string v1, "already closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1763
    :cond_0
    return-void
.end method

.method public declared-synchronized mark(I)V
    .locals 1
    .param p1, "readlimit"    # I

    .prologue
    .line 1608
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->chkOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1609
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->mark(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1610
    :cond_0
    monitor-exit p0

    return-void

    .line 1608
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 1622
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->chkOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1623
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->markSupported()Z

    move-result v0

    .line 1625
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1695
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1696
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1716
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1717
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p1, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1739
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1740
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public declared-synchronized reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1639
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1640
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1641
    monitor-exit p0

    return-void

    .line 1639
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public skip(J)J
    .locals 2
    .param p1, "bytes"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1672
    invoke-virtual {p0}, Lcom/beyond/io/http$FilterInputStream;->ensureOpen()V

    .line 1673
    iget-object v0, p0, Lcom/beyond/io/http$FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    return-wide v0
.end method
