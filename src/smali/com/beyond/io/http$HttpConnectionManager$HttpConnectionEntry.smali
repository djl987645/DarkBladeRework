.class Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;
.super Ljava/lang/Object;
.source "http.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/io/http$HttpConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HttpConnectionEntry"
.end annotation


# instance fields
.field appID:I

.field connString:Ljava/lang/String;

.field host:Ljava/lang/String;

.field in:Lcom/beyond/io/http$BufferedInputStream;

.field inUse:Z

.field out:Ljava/io/DataOutputStream;

.field port:I

.field soc:Lorg/kwis/msf/io/Socket;

.field final synthetic this$1:Lcom/beyond/io/http$HttpConnectionManager;


# direct methods
.method private constructor <init>(Lcom/beyond/io/http$HttpConnectionManager;)V
    .locals 0

    .prologue
    .line 205
    iput-object p1, p0, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;->this$1:Lcom/beyond/io/http$HttpConnectionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/beyond/io/http$HttpConnectionManager;Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;)V
    .locals 0

    .prologue
    .line 205
    invoke-direct {p0, p1}, Lcom/beyond/io/http$HttpConnectionManager$HttpConnectionEntry;-><init>(Lcom/beyond/io/http$HttpConnectionManager;)V

    return-void
.end method
