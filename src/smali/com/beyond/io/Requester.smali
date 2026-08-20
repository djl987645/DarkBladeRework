.class Lcom/beyond/io/Requester;
.super Ljava/lang/Object;
.source "Requester.java"


# instance fields
.field addr:[B

.field addrlen:I

.field appID:I

.field buf:[B

.field cmd:I

.field fd:I

.field fd2:I

.field requesting:Z

.field ret:I

.field waken:Z


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 2
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "fd"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput v0, p0, Lcom/beyond/io/Requester;->appID:I

    .line 6
    iput v0, p0, Lcom/beyond/io/Requester;->fd2:I

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/io/Requester;->addr:[B

    .line 12
    iput-boolean v1, p0, Lcom/beyond/io/Requester;->waken:Z

    .line 13
    const/16 v0, 0x21a

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/beyond/io/Requester;->buf:[B

    .line 16
    iput-boolean v1, p0, Lcom/beyond/io/Requester;->requesting:Z

    .line 19
    iput p2, p0, Lcom/beyond/io/Requester;->fd:I

    .line 21
    if-nez p1, :cond_0

    .line 26
    :goto_0
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/io/Requester;->addr:[B

    .line 25
    iget-object v0, p0, Lcom/beyond/io/Requester;->addr:[B

    array-length v0, v0

    iput v0, p0, Lcom/beyond/io/Requester;->addrlen:I

    goto :goto_0
.end method
