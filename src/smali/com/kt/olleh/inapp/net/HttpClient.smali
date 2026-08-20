.class public Lcom/kt/olleh/inapp/net/HttpClient;
.super Ljava/lang/Object;
.source "HttpClient.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    return-void
.end method

.method public static getInstance(IIILjava/lang/String;)Lcom/kt/olleh/inapp/net/HttpClient;
    .locals 1
    .param p0, "connectTimeout"    # I
    .param p1, "soTimeout"    # I
    .param p2, "bufferSize"    # I
    .param p3, "userAgent"    # Ljava/lang/String;

    .prologue
    .line 14
    new-instance v0, Lcom/kt/olleh/inapp/net/HttpClient;

    invoke-direct {v0}, Lcom/kt/olleh/inapp/net/HttpClient;-><init>()V

    .line 16
    .local v0, "client":Lcom/kt/olleh/inapp/net/HttpClient;
    return-object v0
.end method


# virtual methods
.method public getLastError()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public sendPost(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 21
    const/4 v0, 0x0

    return-object v0
.end method

.method public sendPost(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "ssoCookie"    # Ljava/lang/String;

    .prologue
    .line 33
    const/4 v0, 0x0

    return-object v0
.end method

.method public sendPost(Ljava/lang/String;ZLjava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "isUpdateCookie"    # Z
    .param p3, "serverType"    # Ljava/lang/String;

    .prologue
    .line 27
    const/4 v0, 0x0

    return-object v0
.end method
