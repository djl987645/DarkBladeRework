.class public Lcom/kt/olleh/inapp/net/ResDIBuy;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIBuy.java"


# instance fields
.field public mApp_id:Ljava/lang/String;

.field public mDi_id:Ljava/lang/String;

.field public mSeq_key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 35
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 37
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    .line 38
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    .line 41
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    .line 46
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    .line 47
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    .line 49
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 50
    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDiId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    return-object v0
.end method

.method public getSeqKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 54
    if-nez p1, :cond_1

    .line 77
    :cond_0
    :goto_0
    return v1

    .line 57
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 61
    const-string v3, "app_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 63
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIBuy;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    move v1, v2

    .line 64
    goto :goto_0

    .line 66
    :cond_2
    const-string v3, "seq_key"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 68
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIBuy;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    move v1, v2

    .line 69
    goto :goto_0

    .line 71
    :cond_3
    const-string v3, "di_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 73
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIBuy;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    move v1, v2

    .line 74
    goto :goto_0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appid"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setDiId(Ljava/lang/String;)V
    .locals 0
    .param p1, "diid"    # Ljava/lang/String;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public setSeqKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "seqkey"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 113
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 115
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 117
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mApp_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    const-string v1, "seq_key"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mSeq_key:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string v1, "di_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIBuy;->mDi_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
