.class public Lcom/kt/olleh/inapp/net/ResCheckShowId;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResCheckShowId.java"


# instance fields
.field public mSeq_key:Ljava/lang/String;

.field public mShow_id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 20
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 21
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mSeq_key:Ljava/lang/String;

    .line 22
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mShow_id:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mSeq_key:Ljava/lang/String;

    .line 28
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mShow_id:Ljava/lang/String;

    .line 30
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 31
    return-void
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 35
    if-nez p1, :cond_1

    .line 55
    :cond_0
    :goto_0
    return v1

    .line 38
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 42
    const-string v3, "seq_key"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 44
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResCheckShowId;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mSeq_key:Ljava/lang/String;

    .line 45
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResCheckShowId;->toString()Ljava/lang/String;

    move v1, v2

    .line 46
    goto :goto_0

    .line 48
    :cond_2
    const-string v3, "show_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 50
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResCheckShowId;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mShow_id:Ljava/lang/String;

    .line 51
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResCheckShowId;->toString()Ljava/lang/String;

    move v1, v2

    .line 52
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 62
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 64
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mSeq_key:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string v1, "show_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResCheckShowId;->mShow_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
