.class Lcom/beyond/KTPurchaseActivity$1;
.super Ljava/lang/Object;
.source "KTPurchaseActivity.java"

# interfaces
.implements Lcom/kt/olleh/inapp/OnInAppListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/beyond/KTPurchaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/beyond/KTPurchaseActivity;


# direct methods
.method constructor <init>(Lcom/beyond/KTPurchaseActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/beyond/KTPurchaseActivity$1;->this$0:Lcom/beyond/KTPurchaseActivity;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "errorCode"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x3

    const/4 v1, 0x0

    .line 85
    const-string v0, "I001"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-static {v2, v1}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 102
    :goto_0
    return-void

    .line 92
    :cond_0
    const-string v0, "I002"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    invoke-static {v2, v1}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    goto :goto_0

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/beyond/KTPurchaseActivity$1;->this$0:Lcom/beyond/KTPurchaseActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\uc544\uc774\ud15c \uad6c\ub9e4 \uc2e4\ud328 : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Lcom/beyond/KTPurchaseActivity;->access$0(Lcom/beyond/KTPurchaseActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public OnResultAPI(Ljava/lang/String;Lcom/kt/olleh/inapp/net/Response;)V
    .locals 1
    .param p1, "api"    # Ljava/lang/String;
    .param p2, "data"    # Lcom/kt/olleh/inapp/net/Response;

    .prologue
    .line 72
    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 74
    return-void
.end method

.method public OnResultFileURL(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 114
    return-void
.end method

.method public OnResultOLDAPI(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 110
    return-void
.end method

.method public OnResultPurchase(Ljava/lang/String;)V
    .locals 1
    .param p1, "tr_id"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 65
    invoke-static {v0, v0}, Lcom/beyond/CletActivity;->handleSendBuyEvent(II)V

    .line 66
    return-void
.end method
