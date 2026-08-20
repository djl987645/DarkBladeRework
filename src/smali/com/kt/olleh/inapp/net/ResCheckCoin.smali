.class public Lcom/kt/olleh/inapp/net/ResCheckCoin;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResCheckCoin.java"


# instance fields
.field public mAmount:Ljava/lang/String;

.field public mCoin:Ljava/lang/String;

.field public mSeq_key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 31
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mSeq_key:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mCoin:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mAmount:Ljava/lang/String;

    .line 34
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mSeq_key:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mCoin:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mAmount:Ljava/lang/String;

    .line 42
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 43
    return-void
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 47
    if-nez p1, :cond_1

    .line 72
    :cond_0
    :goto_0
    return v1

    .line 50
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 54
    const-string v3, "seq_key"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 56
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mSeq_key:Ljava/lang/String;

    .line 57
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->toString()Ljava/lang/String;

    move v1, v2

    .line 58
    goto :goto_0

    .line 60
    :cond_2
    const-string v3, "coin"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 62
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mCoin:Ljava/lang/String;

    .line 63
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->toString()Ljava/lang/String;

    move v1, v2

    .line 64
    goto :goto_0

    .line 66
    :cond_3
    const-string v3, "amount"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 68
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mAmount:Ljava/lang/String;

    .line 69
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResCheckCoin;->toString()Ljava/lang/String;

    move v1, v2

    .line 70
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 79
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    const-string v1, "seq_key"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mSeq_key:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const-string v1, "coin"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mCoin:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    const-string v1, "amount"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResCheckCoin;->mAmount:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
