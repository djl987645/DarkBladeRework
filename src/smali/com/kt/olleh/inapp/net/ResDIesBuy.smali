.class public Lcom/kt/olleh/inapp/net/ResDIesBuy;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIesBuy.java"


# instance fields
.field public mResultCode:Ljava/lang/String;

.field public mResultMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 26
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    .line 35
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 36
    return-void
.end method

.method public getResultCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    return-object v0
.end method

.method public getResultMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 40
    if-nez p1, :cond_1

    .line 57
    :cond_0
    :goto_0
    return v1

    .line 43
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 47
    const-string v3, "resultCode"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 49
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIesBuy;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    move v1, v2

    .line 50
    goto :goto_0

    .line 52
    :cond_2
    const-string v3, "resultMessage"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIesBuy;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    move v1, v2

    .line 55
    goto :goto_0
.end method

.method public setResultCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "resultcode"    # Ljava/lang/String;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setResultMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "resultmsg"    # Ljava/lang/String;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 85
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 87
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    const-string v1, "resultCode"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultCode:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    const-string v1, "resultMessage"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIesBuy;->mResultMessage:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
