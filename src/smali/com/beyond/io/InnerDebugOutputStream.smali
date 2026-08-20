.class Lcom/beyond/io/InnerDebugOutputStream;
.super Ljava/io/OutputStream;
.source "debug.java"


# instance fields
.field father:Lcom/beyond/io/debug;


# direct methods
.method public constructor <init>(Lcom/beyond/io/debug;)V
    .locals 0
    .param p1, "f"    # Lcom/beyond/io/debug;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/beyond/io/InnerDebugOutputStream;->father:Lcom/beyond/io/debug;

    .line 45
    return-void
.end method

.method private static native putc(I)V
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 2

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/InnerDebugOutputStream;->father:Lcom/beyond/io/debug;

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/beyond/io/InnerDebugOutputStream;->father:Lcom/beyond/io/debug;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/beyond/io/debug;->opened:Z

    .line 58
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/InnerDebugOutputStream;->father:Lcom/beyond/io/debug;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :cond_0
    monitor-exit p0

    return-void

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isStream()Z
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized write(I)V
    .locals 2
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/io/InnerDebugOutputStream;->father:Lcom/beyond/io/debug;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Ljava/io/IOException;

    const-string v1, "stream closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 51
    :cond_0
    :try_start_1
    invoke-static {p1}, Lcom/beyond/io/InnerDebugOutputStream;->putc(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    monitor-exit p0

    return-void
.end method
