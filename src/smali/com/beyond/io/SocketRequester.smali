.class Lcom/beyond/io/SocketRequester;
.super Lcom/beyond/io/Requester;
.source "SocketRequester.java"


# instance fields
.field brother:Lcom/beyond/io/SocketRequester;

.field data:[B

.field host:Ljava/lang/String;

.field input:Z

.field len:I

.field pcfd:I

.field pcfd2:I

.field port:S

.field pos:I

.field remoteip:I

.field remoteport:S

.field sock_name:[B

.field stream:Z

.field tot:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "fd"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/beyond/io/Requester;-><init>(Ljava/lang/String;I)V

    .line 4
    iput v1, p0, Lcom/beyond/io/SocketRequester;->tot:I

    .line 5
    iput v2, p0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 6
    iput v2, p0, Lcom/beyond/io/SocketRequester;->pcfd2:I

    .line 7
    iput-boolean v0, p0, Lcom/beyond/io/SocketRequester;->stream:Z

    .line 8
    iput-short v1, p0, Lcom/beyond/io/SocketRequester;->port:S

    .line 11
    iput-boolean v0, p0, Lcom/beyond/io/SocketRequester;->input:Z

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 16
    iput v2, p0, Lcom/beyond/io/SocketRequester;->remoteip:I

    .line 17
    iput-short v1, p0, Lcom/beyond/io/SocketRequester;->remoteport:S

    .line 19
    iput v1, p0, Lcom/beyond/io/SocketRequester;->len:I

    .line 20
    const/4 v0, 0x6

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->sock_name:[B

    .line 21
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->data:[B

    .line 22
    iput v1, p0, Lcom/beyond/io/SocketRequester;->pos:I

    .line 26
    iput-object p1, p0, Lcom/beyond/io/SocketRequester;->host:Ljava/lang/String;

    .line 27
    return-void
.end method

.method constructor <init>(ZLjava/lang/String;SI)V
    .locals 3
    .param p1, "stream"    # Z
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # S
    .param p4, "fd"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 30
    invoke-direct {p0, p2, p4}, Lcom/beyond/io/Requester;-><init>(Ljava/lang/String;I)V

    .line 4
    iput v1, p0, Lcom/beyond/io/SocketRequester;->tot:I

    .line 5
    iput v2, p0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 6
    iput v2, p0, Lcom/beyond/io/SocketRequester;->pcfd2:I

    .line 7
    iput-boolean v0, p0, Lcom/beyond/io/SocketRequester;->stream:Z

    .line 8
    iput-short v1, p0, Lcom/beyond/io/SocketRequester;->port:S

    .line 11
    iput-boolean v0, p0, Lcom/beyond/io/SocketRequester;->input:Z

    .line 13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 16
    iput v2, p0, Lcom/beyond/io/SocketRequester;->remoteip:I

    .line 17
    iput-short v1, p0, Lcom/beyond/io/SocketRequester;->remoteport:S

    .line 19
    iput v1, p0, Lcom/beyond/io/SocketRequester;->len:I

    .line 20
    const/4 v0, 0x6

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->sock_name:[B

    .line 21
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->data:[B

    .line 22
    iput v1, p0, Lcom/beyond/io/SocketRequester;->pos:I

    .line 31
    if-eqz p1, :cond_0

    .line 32
    iput-short p3, p0, Lcom/beyond/io/SocketRequester;->port:S

    .line 34
    :cond_0
    iput-boolean p1, p0, Lcom/beyond/io/SocketRequester;->stream:Z

    .line 35
    iput-object p2, p0, Lcom/beyond/io/SocketRequester;->host:Ljava/lang/String;

    .line 36
    return-void
.end method


# virtual methods
.method dup()V
    .locals 5

    .prologue
    .line 39
    new-instance v0, Lcom/beyond/io/SocketRequester;

    iget-boolean v1, p0, Lcom/beyond/io/SocketRequester;->stream:Z

    iget-object v2, p0, Lcom/beyond/io/SocketRequester;->host:Ljava/lang/String;

    iget-short v3, p0, Lcom/beyond/io/SocketRequester;->port:S

    iget v4, p0, Lcom/beyond/io/SocketRequester;->fd:I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/beyond/io/SocketRequester;-><init>(ZLjava/lang/String;SI)V

    iput-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 40
    iget-object v1, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iget-boolean v0, p0, Lcom/beyond/io/SocketRequester;->input:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, v1, Lcom/beyond/io/SocketRequester;->input:Z

    .line 41
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iput-object p0, v0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    .line 42
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iget v1, p0, Lcom/beyond/io/SocketRequester;->pcfd:I

    iput v1, v0, Lcom/beyond/io/SocketRequester;->pcfd:I

    .line 43
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iget v1, p0, Lcom/beyond/io/SocketRequester;->pcfd2:I

    iput v1, v0, Lcom/beyond/io/SocketRequester;->pcfd2:I

    .line 44
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    iget v1, p0, Lcom/beyond/io/SocketRequester;->appID:I

    iput v1, v0, Lcom/beyond/io/SocketRequester;->appID:I

    .line 45
    return-void

    .line 40
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method declared-synchronized getInputRequester()Lcom/beyond/io/SocketRequester;
    .locals 1

    .prologue
    .line 49
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    if-nez v0, :cond_0

    .line 50
    invoke-virtual {p0}, Lcom/beyond/io/SocketRequester;->dup()V

    .line 52
    :cond_0
    iget-boolean v0, p0, Lcom/beyond/io/SocketRequester;->input:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    move-object v0, p0

    .line 55
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getOutputRequester()Lcom/beyond/io/SocketRequester;
    .locals 1

    .prologue
    .line 60
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;

    if-nez v0, :cond_0

    .line 61
    invoke-virtual {p0}, Lcom/beyond/io/SocketRequester;->dup()V

    .line 63
    :cond_0
    iget-boolean v0, p0, Lcom/beyond/io/SocketRequester;->input:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    move-object v0, p0

    .line 66
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/beyond/io/SocketRequester;->brother:Lcom/beyond/io/SocketRequester;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 60
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
