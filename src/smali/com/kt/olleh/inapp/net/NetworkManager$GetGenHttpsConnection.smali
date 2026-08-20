.class Lcom/kt/olleh/inapp/net/NetworkManager$GetGenHttpsConnection;
.super Ljavax/net/ssl/HttpsURLConnection;
.source "NetworkManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/kt/olleh/inapp/net/NetworkManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "GetGenHttpsConnection"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/kt/olleh/inapp/net/NetworkManager;


# direct methods
.method protected constructor <init>(Lcom/kt/olleh/inapp/net/NetworkManager;Ljava/net/URL;)V
    .locals 0
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/NetworkManager$GetGenHttpsConnection;->this$0:Lcom/kt/olleh/inapp/net/NetworkManager;

    .line 225
    invoke-direct {p0, p2}, Ljavax/net/ssl/HttpsURLConnection;-><init>(Ljava/net/URL;)V

    return-void
.end method


# virtual methods
.method public connect()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    return-void
.end method

.method public disconnect()V
    .locals 0

    .prologue
    .line 252
    return-void
.end method

.method public getCipherSuite()Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLocalCertificates()[Ljava/security/cert/Certificate;
    .locals 1

    .prologue
    .line 238
    const/4 v0, 0x0

    return-object v0
.end method

.method public getServerCertificates()[Ljava/security/cert/Certificate;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .prologue
    .line 245
    const/4 v0, 0x0

    return-object v0
.end method

.method public usingProxy()Z
    .locals 1

    .prologue
    .line 257
    const/4 v0, 0x0

    return v0
.end method
