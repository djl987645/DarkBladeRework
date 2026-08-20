.class public Lcom/kt/olleh/inapp/net/ResDIGetFile;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIGetFile.java"


# instance fields
.field public mFile2byte:Ljava/lang/String;

.field public mSeq_key:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 27
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    .line 28
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    .line 34
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    .line 37
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 38
    return-void
.end method

.method public getFile2byte()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    return-object v0
.end method

.method public getSeqKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 42
    if-nez p1, :cond_1

    .line 60
    :cond_0
    :goto_0
    return v1

    .line 45
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 49
    const-string v3, "seq_key"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 51
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIGetFile;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    move v1, v2

    .line 52
    goto :goto_0

    .line 54
    :cond_2
    const-string v3, "file2byte"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 56
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIGetFile;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    move v1, v2

    .line 57
    goto :goto_0
.end method

.method public setFile2byte(Ljava/lang/String;)V
    .locals 0
    .param p1, "file2byte"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setSeqKey(Ljava/lang/String;)V
    .locals 0
    .param p1, "seqkey"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 86
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 88
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mSeq_key:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    const-string v1, "file2byte"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIGetFile;->mFile2byte:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
