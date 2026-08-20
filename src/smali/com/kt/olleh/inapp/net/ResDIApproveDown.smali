.class public Lcom/kt/olleh/inapp/net/ResDIApproveDown;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIApproveDown.java"


# instance fields
.field public mApp_id:Ljava/lang/String;

.field public mDi_id:Ljava/lang/String;

.field public mFile_name:Ljava/lang/String;

.field public mMime_type:Ljava/lang/String;

.field public mSeq_key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 38
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    .line 39
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    .line 42
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    .line 49
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    .line 51
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    .line 53
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 54
    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    return-object v0
.end method

.method public getDiId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    return-object v0
.end method

.method public getSeqKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 58
    if-nez p1, :cond_1

    .line 91
    :cond_0
    :goto_0
    return v1

    .line 61
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 65
    const-string v3, "app_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 67
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    move v1, v2

    .line 68
    goto :goto_0

    .line 70
    :cond_2
    const-string v3, "di_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 72
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    move v1, v2

    .line 73
    goto :goto_0

    .line 75
    :cond_3
    const-string v3, "seq_key"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 77
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    move v1, v2

    .line 78
    goto :goto_0

    .line 80
    :cond_4
    const-string v3, "file_name"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 82
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    move v1, v2

    .line 83
    goto :goto_0

    .line 85
    :cond_5
    const-string v3, "mime_type"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    move v1, v2

    .line 88
    goto :goto_0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appid"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    .line 104
    return-void
.end method

.method public setDiId(Ljava/lang/String;)V
    .locals 0
    .param p1, "diid"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    .line 137
    return-void
.end method

.method public setMimeType(Ljava/lang/String;)V
    .locals 0
    .param p1, "mimetype"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public setSeqKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "seqkey"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 152
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 154
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mApp_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    const-string v1, "seq_key"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mSeq_key:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    const-string v1, "di_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mDi_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    const-string v1, "file_name"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mFile_name:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const-string v1, "mime_type"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIApproveDown;->mMime_type:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
