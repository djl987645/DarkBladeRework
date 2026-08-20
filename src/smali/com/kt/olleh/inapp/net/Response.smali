.class public abstract Lcom/kt/olleh/inapp/net/Response;
.super Ljava/lang/Object;
.source "Response.java"

# interfaces
.implements Lcom/kt/olleh/inapp/net/ResTags;


# static fields
.field private static final TAG:Ljava/lang/String; = "Response"


# instance fields
.field public mCode:Ljava/lang/String;

.field public mReason:Ljava/lang/String;

.field public mTr_id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mTr_id:Ljava/lang/String;

    .line 19
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    .line 20
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mReason:Ljava/lang/String;

    .line 21
    return-void
.end method

.method private ParseResult(Lorg/w3c/dom/NodeList;)V
    .locals 3
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 88
    if-nez p1, :cond_1

    .line 97
    :cond_0
    return-void

    .line 91
    :cond_1
    const/4 v0, 0x0

    .line 92
    .local v0, "i":I
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    .line 93
    .local v1, "len":I
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 95
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/kt/olleh/inapp/net/Response;->searchResultTag(Lorg/w3c/dom/Node;)Z

    .line 93
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private ParseValue(Lorg/w3c/dom/NodeList;)V
    .locals 3
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 106
    if-nez p1, :cond_1

    .line 115
    :cond_0
    return-void

    .line 109
    :cond_1
    const/4 v0, 0x0

    .line 110
    .local v0, "i":I
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    .line 111
    .local v1, "len":I
    const/4 v0, 0x0

    :goto_0
    if-ge v0, v1, :cond_0

    .line 113
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/kt/olleh/inapp/net/Response;->searchValueTag(Lorg/w3c/dom/Node;)Z

    .line 111
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private findTag(Lorg/w3c/dom/NodeList;Ljava/lang/String;)Lorg/w3c/dom/NodeList;
    .locals 5
    .param p1, "list"    # Lorg/w3c/dom/NodeList;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 126
    if-nez p1, :cond_1

    .line 138
    :cond_0
    :goto_0
    return-object v3

    .line 129
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    .line 130
    .local v2, "listLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_0

    .line 132
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 133
    .local v1, "item":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 135
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    goto :goto_0

    .line 130
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method protected static getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 6
    .param p0, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v4, 0x0

    .line 61
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 62
    .local v2, "list":Lorg/w3c/dom/NodeList;
    if-nez v2, :cond_1

    .line 78
    :cond_0
    :goto_0
    return-object v4

    .line 65
    :cond_1
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    .line 66
    .local v1, "len":I
    if-lez v1, :cond_0

    .line 69
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 71
    invoke-interface {v2, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    .line 72
    .local v3, "node":Lorg/w3c/dom/Node;
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 74
    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 69
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mTr_id:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/Response;->mReason:Ljava/lang/String;

    .line 28
    return-void
.end method

.method public parseXML(Lorg/w3c/dom/NodeList;)Z
    .locals 2
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    const/4 v1, 0x0

    .line 148
    if-nez p1, :cond_1

    .line 161
    :cond_0
    :goto_0
    return v1

    .line 151
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    .line 152
    .local v0, "len":I
    if-lez v0, :cond_0

    .line 156
    const-string v1, "result"

    invoke-direct {p0, p1, v1}, Lcom/kt/olleh/inapp/net/Response;->findTag(Lorg/w3c/dom/NodeList;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/kt/olleh/inapp/net/Response;->ParseResult(Lorg/w3c/dom/NodeList;)V

    .line 159
    const-string v1, "value"

    invoke-direct {p0, p1, v1}, Lcom/kt/olleh/inapp/net/Response;->findTag(Lorg/w3c/dom/NodeList;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/kt/olleh/inapp/net/Response;->ParseValue(Lorg/w3c/dom/NodeList;)V

    .line 161
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected searchResultTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 32
    if-nez p1, :cond_1

    .line 54
    :cond_0
    :goto_0
    return v1

    .line 35
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 39
    const-string v3, "tr_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 41
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/Response;->mTr_id:Ljava/lang/String;

    move v1, v2

    .line 42
    goto :goto_0

    .line 44
    :cond_2
    const-string v3, "code"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 46
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    move v1, v2

    .line 47
    goto :goto_0

    .line 49
    :cond_3
    const-string v3, "reason"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 51
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/Response;->mReason:Ljava/lang/String;

    move v1, v2

    .line 52
    goto :goto_0
.end method

.method protected abstract searchValueTag(Lorg/w3c/dom/Node;)Z
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 169
    .local v0, "str":Ljava/lang/StringBuffer;
    const-string v1, "tr_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/Response;->mTr_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    const-string v1, "code"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/Response;->mCode:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    const-string v1, "reason"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/Response;->mReason:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
