.class public Lcom/kt/olleh/inapp/net/ResDIDetail;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIDetail.java"


# instance fields
.field public mApp_id:Ljava/lang/String;

.field public mDesc:Ljava/lang/String;

.field public mDi_id:Ljava/lang/String;

.field public mDi_title:Ljava/lang/String;

.field public mPrice:Ljava/lang/String;

.field public mUse_lmt_cnt:Ljava/lang/String;

.field public mUse_term:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 46
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 47
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    .line 49
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    .line 51
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    .line 52
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    .line 53
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    .line 60
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    .line 61
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    .line 62
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    .line 63
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    .line 64
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    .line 65
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    .line 67
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 68
    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDesc()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    return-object v0
.end method

.method public getDiId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDiTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    return-object v0
.end method

.method public getUseLmtCnt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    return-object v0
.end method

.method public getUseTerm()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 72
    if-nez p1, :cond_1

    .line 114
    :cond_0
    :goto_0
    return v1

    .line 75
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 79
    const-string v3, "app_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 81
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    move v1, v2

    .line 82
    goto :goto_0

    .line 84
    :cond_2
    const-string v3, "di_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 86
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    move v1, v2

    .line 87
    goto :goto_0

    .line 89
    :cond_3
    const-string v3, "di_title"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 91
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    move v1, v2

    .line 92
    goto :goto_0

    .line 94
    :cond_4
    const-string v3, "desc"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 96
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    move v1, v2

    .line 97
    goto :goto_0

    .line 99
    :cond_5
    const-string v3, "price"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 101
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    move v1, v2

    .line 102
    goto :goto_0

    .line 104
    :cond_6
    const-string v3, "use_term"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 106
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    move v1, v2

    .line 107
    goto :goto_0

    .line 109
    :cond_7
    const-string v3, "use_lmt_cnt"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 111
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIDetail;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    move v1, v2

    .line 112
    goto :goto_0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appid"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setDesc(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setDiId(Ljava/lang/String;)V
    .locals 0
    .param p1, "diid"    # Ljava/lang/String;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    .line 136
    return-void
.end method

.method public setDiTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "dititle"    # Ljava/lang/String;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    .line 149
    return-void
.end method

.method public setPrice(Ljava/lang/String;)V
    .locals 0
    .param p1, "price"    # Ljava/lang/String;

    .prologue
    .line 169
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    .line 170
    return-void
.end method

.method public setUseLmtCnt(Ljava/lang/String;)V
    .locals 0
    .param p1, "uselmtcnt"    # Ljava/lang/String;

    .prologue
    .line 191
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    .line 192
    return-void
.end method

.method public setUseTerm(Ljava/lang/String;)V
    .locals 0
    .param p1, "useterm"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    .line 181
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 196
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 198
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mApp_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const-string v1, "di_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    const-string v1, "di_title"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDi_title:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    const-string v1, "desc"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mDesc:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v1, "price"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mPrice:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    const-string v1, "use_term"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_term:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    const-string v1, "use_lmt_cnt"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIDetail;->mUse_lmt_cnt:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
