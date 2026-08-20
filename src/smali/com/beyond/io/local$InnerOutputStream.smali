.class public Lcom/beyond/io/local$InnerOutputStream;
.super Ljava/io/OutputStream;
.source "local.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/local;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InnerOutputStream"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/io/local;


# direct methods
.method public constructor <init>(Lcom/beyond/io/local;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    return-void
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    monitor-enter p0

    monitor-exit p0

    return-object p0
.end method

.method public write(I)V
    .locals 0
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
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
    .line 177
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/beyond/io/local$InnerOutputStream;->write([BII)V

    .line 178
    return-void
.end method

.method public declared-synchronized write([BII)V
    .locals 6
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 143
    :try_start_1
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$2(Lcom/beyond/io/local;)I

    move-result v2

    if-lt p3, v2, :cond_0

    .line 144
    new-instance v2, Ljava/io/IOException;

    const-string v4, "buf full"

    invoke-direct {v2, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 142
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 146
    :cond_0
    :try_start_3
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$7(Lcom/beyond/io/local;)I

    move-result v2

    add-int/2addr v2, p3

    iget-object v4, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$1(Lcom/beyond/io/local;)I

    move-result v4

    if-le v2, v4, :cond_1

    .line 147
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$1(Lcom/beyond/io/local;)I

    move-result v2

    iget-object v4, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$7(Lcom/beyond/io/local;)I

    move-result v4

    sub-int v0, v2, v4

    .line 148
    .local v0, "copySize":I
    sub-int v1, p3, v0

    .line 150
    .local v1, "restSize":I
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v2

    iget-object v4, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$7(Lcom/beyond/io/local;)I

    move-result v4

    invoke-static {p1, p2, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    add-int v2, p2, v0

    iget-object v4, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {p1, v2, v4, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 152
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2, v1}, Lcom/beyond/io/local;->access$8(Lcom/beyond/io/local;I)V

    .line 159
    .end local v0    # "copySize":I
    .end local v1    # "restSize":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$2(Lcom/beyond/io/local;)I

    move-result v4

    sub-int/2addr v4, p3

    invoke-static {v2, v4}, Lcom/beyond/io/local;->access$6(Lcom/beyond/io/local;I)V

    .line 167
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$0(Lcom/beyond/io/local;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 142
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 169
    monitor-exit p0

    return-void

    .line 155
    :cond_1
    :try_start_4
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$4(Lcom/beyond/io/local;)[B

    move-result-object v2

    iget-object v4, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v4}, Lcom/beyond/io/local;->access$7(Lcom/beyond/io/local;)I

    move-result v4

    invoke-static {p1, p2, v2, v4, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 156
    iget-object v2, p0, Lcom/beyond/io/local$InnerOutputStream;->this$0:Lcom/beyond/io/local;

    invoke-static {v2}, Lcom/beyond/io/local;->access$7(Lcom/beyond/io/local;)I

    move-result v4

    add-int/2addr v4, p3

    invoke-static {v2, v4}, Lcom/beyond/io/local;->access$8(Lcom/beyond/io/local;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_0
.end method
