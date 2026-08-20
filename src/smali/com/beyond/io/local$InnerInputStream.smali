.class public Lcom/beyond/io/local$InnerInputStream;
.super Ljava/io/InputStream;
.source "local.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/local;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InnerInputStream"
.end annotation


# instance fields
.field private isOpen:Z

.field final synthetic this$0:Lcom/beyond/io/local;


# direct methods
.method public constructor <init>(Lcom/beyond/io/local;)V
    .locals 1

    .prologue
    .line 67
    iput-object p1, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/local$InnerInputStream;->isOpen:Z

    .line 67
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
    .line 124
    iget-object v0, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v0}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 125
    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/beyond/io/local$InnerInputStream;->isOpen:Z

    .line 126
    iget-object v0, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v0}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 124
    monitor-exit v1

    .line 128
    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/beyond/io/local$InnerInputStream;->isOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    monitor-exit p0

    return-object p0

    .line 70
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 76
    new-array v1, v2, [B

    .line 79
    .local v1, "one":[B
    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p0, v1, v2, v3}, Lcom/beyond/io/local$InnerInputStream;->read([BII)I

    move-result v2

    if-lez v2, :cond_0

    .line 80
    const/4 v2, 0x0

    aget-byte v2, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit16 v2, v2, 0xff

    .line 84
    :goto_0
    return v2

    .line 81
    :catch_0
    move-exception v0

    .line 82
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 84
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "abyte0"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/beyond/io/local$InnerInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public declared-synchronized read([BII)I
    .locals 7
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 93
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v4

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 94
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$1(Lcom/beyond/io/local;)I

    move-result v5

    iget-object v6, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v6}, Lcom/beyond/io/local;->access$2(Lcom/beyond/io/local;)I

    move-result v6

    sub-int/2addr v5, v6

    if-lt v5, p3, :cond_1

    .line 104
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$3(Lcom/beyond/io/local;)I

    move-result v3

    add-int/2addr v3, p3

    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$1(Lcom/beyond/io/local;)I

    move-result v5

    if-le v3, v5, :cond_2

    .line 105
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$1(Lcom/beyond/io/local;)I

    move-result v3

    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$3(Lcom/beyond/io/local;)I

    move-result v5

    sub-int v0, v3, v5

    .line 106
    .local v0, "copySize":I
    sub-int v2, p3, v0

    .line 108
    .local v2, "restSize":I
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v3

    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$3(Lcom/beyond/io/local;)I

    move-result v5

    invoke-static {v3, v5, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 109
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v3

    const/4 v5, 0x0

    add-int v6, p2, v0

    invoke-static {v3, v5, p1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 110
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3, v2}, Lcom/beyond/io/local;->access$5(Lcom/beyond/io/local;I)V

    .line 117
    .end local v0    # "copySize":I
    .end local v2    # "restSize":I
    :goto_0
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$2(Lcom/beyond/io/local;)I

    move-result v5

    add-int/2addr v5, p3

    invoke-static {v3, v5}, Lcom/beyond/io/local;->access$6(Lcom/beyond/io/local;I)V

    .line 119
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local p3    # "len":I
    :goto_1
    monitor-exit p0

    return p3

    .line 96
    .restart local p3    # "len":I
    :cond_1
    :try_start_2
    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 101
    :try_start_3
    iget-boolean v5, p0, Lcom/beyond/io/local$InnerInputStream;->isOpen:Z

    if-nez v5, :cond_0

    .line 102
    monitor-exit v4

    move p3, v3

    goto :goto_1

    .line 97
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 99
    monitor-exit v4

    move p3, v3

    goto :goto_1

    .line 113
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v3

    iget-object v5, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v5}, Lcom/beyond/io/local;->access$3(Lcom/beyond/io/local;)I

    move-result v5

    invoke-static {v3, v5, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    iget-object v3, p0, Lcom/beyond/io/local$InnerInputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v3}, Lcom/beyond/io/local;->access$3(Lcom/beyond/io/local;)I

    move-result v5

    add-int/2addr v5, p3

    invoke-static {v3, v5}, Lcom/beyond/io/local;->access$5(Lcom/beyond/io/local;I)V

    goto :goto_0

    .line 93
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method
