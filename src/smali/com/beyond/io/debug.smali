.class public Lcom/beyond/io/debug;
.super Lcom/beyond/io/SocketModel;
.source "debug.java"

# interfaces
.implements Lorg/kwis/msf/io/Socket;


# instance fields
.field protected opened:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/beyond/io/SocketModel;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/beyond/io/debug;->opened:Z

    .line 13
    return-void
.end method

.method public static openDebugPort()V
    .locals 0

    .prologue
    .line 18
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
    .line 37
    return-void
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/beyond/io/debug;->opened:Z

    if-eqz v0, :cond_0

    .line 30
    new-instance v0, Ljava/io/IOException;

    const-string v1, "already opened"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/io/debug;->opened:Z

    .line 33
    new-instance v0, Lcom/beyond/io/InnerDebugOutputStream;

    invoke-direct {v0, p0}, Lcom/beyond/io/InnerDebugOutputStream;-><init>(Lcom/beyond/io/debug;)V

    return-object v0
.end method

.method public parseURI(Ljava/lang/String;)Lorg/kwis/msf/io/Socket;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 22
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "bad parameter:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_0
    return-object p0
.end method
