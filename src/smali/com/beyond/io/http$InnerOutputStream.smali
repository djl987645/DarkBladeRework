.class Lcom/beyond/io/http$InnerOutputStream;
.super Ljava/io/OutputStream;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InnerOutputStream"
.end annotation


# instance fields
.field private _output:Ljava/io/ByteArrayOutputStream;

.field parent:Lcom/beyond/io/http;

.field final synthetic this$0:Lcom/beyond/io/http;


# direct methods
.method public constructor <init>(Lcom/beyond/io/http;Lcom/beyond/io/http;)V
    .locals 1
    .param p2, "parent"    # Lcom/beyond/io/http;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/beyond/io/http$InnerOutputStream;->this$0:Lcom/beyond/io/http;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 165
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->_output:Ljava/io/ByteArrayOutputStream;

    .line 166
    iput-object p2, p0, Lcom/beyond/io/http$InnerOutputStream;->parent:Lcom/beyond/io/http;

    .line 167
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
    .line 187
    :try_start_0
    invoke-virtual {p0}, Lcom/beyond/io/http$InnerOutputStream;->flush()V

    .line 188
    iget-object v1, p0, Lcom/beyond/io/http$InnerOutputStream;->parent:Lcom/beyond/io/http;

    if-eqz v1, :cond_0

    .line 189
    iget-object v1, p0, Lcom/beyond/io/http$InnerOutputStream;->parent:Lcom/beyond/io/http;

    invoke-virtual {v1}, Lcom/beyond/io/http;->realClose()V

    .line 190
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/beyond/io/http$InnerOutputStream;->parent:Lcom/beyond/io/http;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :cond_0
    return-void

    .line 192
    :catch_0
    move-exception v0

    .line 195
    .local v0, "e":Ljava/lang/NullPointerException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "socket is already closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->_output:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->this$0:Lcom/beyond/io/http;

    invoke-virtual {v0}, Lcom/beyond/io/http;->connect()V

    .line 175
    :cond_0
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->_output:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    return v0
.end method

.method public toByteArray()[B
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->_output:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 170
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/http$InnerOutputStream;->_output:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
