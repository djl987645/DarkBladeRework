.class public Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;
.super Ljava/lang/Object;
.source "ResDIListExpandRecord.java"

# interfaces
.implements Lcom/kt/olleh/inapp/net/ResTags;


# instance fields
.field private mDi_id:Ljava/lang/String;

.field private mDi_title:Ljava/lang/String;

.field private mGift_flag:Ljava/lang/String;

.field private mPrice:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mGift_flag:Ljava/lang/String;

    .line 35
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_title:Ljava/lang/String;

    .line 36
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_id:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mPrice:Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mGift_flag:Ljava/lang/String;

    .line 43
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_title:Ljava/lang/String;

    .line 44
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_id:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mPrice:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public getDiID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDiTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_title:Ljava/lang/String;

    return-object v0
.end method

.method public getGiftFlag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mGift_flag:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mPrice:Ljava/lang/String;

    return-object v0
.end method

.method public searchListTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 55
    if-nez p1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return v1

    .line 58
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 62
    const-string v3, "gift_flag"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 64
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->setGiftFlag(Ljava/lang/String;)V

    move v1, v2

    .line 65
    goto :goto_0

    .line 67
    :cond_2
    const-string v3, "di_title"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 69
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->setDiTitle(Ljava/lang/String;)V

    move v1, v2

    .line 70
    goto :goto_0

    .line 72
    :cond_3
    const-string v3, "di_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 74
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->setDiID(Ljava/lang/String;)V

    move v1, v2

    .line 75
    goto :goto_0

    .line 77
    :cond_4
    const-string v3, "price"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 80
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/Response;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->setPrice(Ljava/lang/String;)V

    move v1, v2

    .line 81
    goto :goto_0
.end method

.method public searchRecordTag(Lorg/w3c/dom/NodeList;)V
    .locals 3
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    .line 132
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    .line 133
    .local v1, "recordLen":I
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 137
    return-void

    .line 135
    :cond_0
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->searchListTag(Lorg/w3c/dom/Node;)Z

    .line 133
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setDiID(Ljava/lang/String;)V
    .locals 0
    .param p1, "diid"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_id:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public setDiTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "dititle"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mDi_title:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public setGiftFlag(Ljava/lang/String;)V
    .locals 0
    .param p1, "giftflag"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mGift_flag:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setPrice(Ljava/lang/String;)V
    .locals 0
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->mPrice:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 143
    .local v0, "str":Ljava/lang/StringBuffer;
    const-string v1, "gift_flag"

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->getGiftFlag()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    const-string v1, "di_title"

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->getDiTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    const-string v1, "di_id"

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->getDiID()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    const-string v1, "price"

    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->getPrice()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
