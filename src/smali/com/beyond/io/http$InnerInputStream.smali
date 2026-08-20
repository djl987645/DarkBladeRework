.class Lcom/beyond/io/http$InnerInputStream;
.super Ljava/io/InputStream;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InnerInputStream"
.end annotation


# instance fields
.field private buf_one:[B

.field private left:I

.field lengthunknown:Z

.field private parent:Lcom/beyond/io/http;

.field final synthetic this$0:Lcom/beyond/io/http;

.field private worker:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Lcom/beyond/io/http;Lcom/beyond/io/http;Ljava/io/InputStream;)V
    .locals 3
    .param p2, "parent"    # Lcom/beyond/io/http;
    .param p3, "worker"    # Ljava/io/InputStream;

    .prologue
    const/4 v2, 0x1

    .line 39
    iput-object p1, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 34
    new-array v0, v2, [B

    iput-object v0, p0, Lcom/beyond/io/http$InnerInputStream;->buf_one:[B

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/http$InnerInputStream;->lengthunknown:Z

    .line 40
    iput-object p2, p0, Lcom/beyond/io/http$InnerInputStream;->parent:Lcom/beyond/io/http;

    .line 41
    iput-object p3, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    .line 42
    invoke-virtual {p2}, Lcom/beyond/io/http;->getLength()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    .line 43
    iget v0, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    if-nez v0, :cond_0

    iput-boolean v2, p0, Lcom/beyond/io/http$InnerInputStream;->lengthunknown:Z

    .line 44
    :cond_0
    return-void
.end method

.method private skipFully(Ljava/io/InputStream;I)V
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "bytesleft"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    :goto_0
    if-gtz p2, :cond_1

    .line 119
    :cond_0
    return-void

    .line 113
    :cond_1
    int-to-long v1, p2

    invoke-virtual {p1, v1, v2}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v1

    long-to-int v0, v1

    .line 114
    .local v0, "skipped":I
    if-ltz v0, :cond_0

    .line 117
    sub-int/2addr p2, v0

    goto :goto_0
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
    .line 108
    iget-object v0, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

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
    .line 147
    iget-object v0, p0, Lcom/beyond/io/http$InnerInputStream;->parent:Lcom/beyond/io/http;

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/beyond/io/http$InnerInputStream;->parent:Lcom/beyond/io/http;

    invoke-virtual {v0}, Lcom/beyond/io/http;->realClose()V

    .line 149
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/http$InnerInputStream;->parent:Lcom/beyond/io/http;

    .line 151
    :cond_0
    return-void
.end method

.method public declared-synchronized read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/beyond/io/http$InnerInputStream;->buf_one:[B

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v1, v2, v3}, Lcom/beyond/io/http$InnerInputStream;->read([BII)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 49
    .local v0, "rtn":I
    if-gez v0, :cond_0

    .line 50
    .end local v0    # "rtn":I
    :goto_0
    monitor-exit p0

    return v0

    .restart local v0    # "rtn":I
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/beyond/io/http$InnerInputStream;->buf_one:[B

    const/4 v2, 0x0

    aget-byte v1, v1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    and-int/lit16 v0, v1, 0xff

    goto :goto_0

    .line 48
    .end local v0    # "rtn":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized read([BII)I
    .locals 5
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, -0x1

    .line 55
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, 0x1

    iput-boolean v3, v2, Lcom/beyond/io/http;->whileInRead:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 57
    :try_start_1
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$0(Lcom/beyond/io/http;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 59
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$1(Lcom/beyond/io/http;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-gez v2, :cond_1

    .line 103
    :cond_0
    :goto_0
    :try_start_2
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/beyond/io/http;->whileInRead:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 99
    :goto_1
    monitor-exit p0

    return v0

    .line 62
    :cond_1
    :try_start_3
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$1(Lcom/beyond/io/http;)I

    move-result v2

    if-nez v2, :cond_3

    .line 63
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    iget-object v3, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-static {v2, v3}, Lcom/beyond/io/http;->access$2(Lcom/beyond/io/http;Ljava/io/InputStream;)V

    .line 64
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    iget-object v3, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    iget-object v4, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-static {v3, v4}, Lcom/beyond/io/http;->access$3(Lcom/beyond/io/http;Ljava/io/InputStream;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/beyond/io/http;->access$4(Lcom/beyond/io/http;I)V

    .line 65
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$5(Lcom/beyond/io/http;)I

    move-result v2

    if-nez v2, :cond_2

    .line 66
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, -0x1

    invoke-static {v2, v3}, Lcom/beyond/io/http;->access$6(Lcom/beyond/io/http;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 102
    :catchall_0
    move-exception v2

    .line 103
    :try_start_4
    iget-object v3, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/beyond/io/http;->whileInRead:Z

    .line 104
    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 55
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 69
    :cond_2
    :try_start_5
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    iget-object v3, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v3}, Lcom/beyond/io/http;->access$5(Lcom/beyond/io/http;)I

    move-result v3

    invoke-static {v2, v3}, Lcom/beyond/io/http;->access$6(Lcom/beyond/io/http;I)V

    .line 71
    :cond_3
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$1(Lcom/beyond/io/http;)I

    move-result v2

    if-gt p3, v2, :cond_4

    .line 72
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 77
    .local v0, "len":I
    :goto_2
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v2}, Lcom/beyond/io/http;->access$1(Lcom/beyond/io/http;)I

    move-result v3

    sub-int/2addr v3, v0

    invoke-static {v2, v3}, Lcom/beyond/io/http;->access$6(Lcom/beyond/io/http;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 103
    :try_start_6
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/beyond/io/http;->whileInRead:Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_1

    .line 75
    .end local v0    # "len":I
    :cond_4
    :try_start_7
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    invoke-static {v3}, Lcom/beyond/io/http;->access$1(Lcom/beyond/io/http;)I

    move-result v3

    invoke-virtual {v2, p1, p2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .restart local v0    # "len":I
    goto :goto_2

    .line 80
    .end local v0    # "len":I
    :cond_5
    iget-boolean v2, p0, Lcom/beyond/io/http$InnerInputStream;->lengthunknown:Z

    if-eqz v2, :cond_6

    .line 81
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v0

    .line 103
    :try_start_8
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/beyond/io/http;->whileInRead:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    .line 86
    :cond_6
    :try_start_9
    iget v2, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    if-lez v2, :cond_0

    .line 90
    iget v2, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    if-ge v2, p3, :cond_8

    .line 91
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    iget v3, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    invoke-virtual {v2, p1, p2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 96
    .local v1, "read":I
    :goto_3
    if-lez v1, :cond_7

    .line 97
    iget v2, p0, Lcom/beyond/io/http$InnerInputStream;->left:I

    sub-int/2addr v2, v1

    iput v2, p0, Lcom/beyond/io/http$InnerInputStream;->left:I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 103
    :cond_7
    :try_start_a
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->this$0:Lcom/beyond/io/http;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/beyond/io/http;->whileInRead:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move v0, v1

    .line 99
    goto/16 :goto_1

    .line 94
    .end local v1    # "read":I
    :cond_8
    :try_start_b
    iget-object v2, p0, Lcom/beyond/io/http$InnerInputStream;->worker:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    move-result v1

    .restart local v1    # "read":I
    goto :goto_3
.end method
