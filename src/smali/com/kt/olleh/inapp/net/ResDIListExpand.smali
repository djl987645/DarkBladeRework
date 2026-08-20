.class public Lcom/kt/olleh/inapp/net/ResDIListExpand;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIListExpand.java"


# instance fields
.field public mApp_id:Ljava/lang/String;

.field public mList_num:Ljava/lang/String;

.field private mRecord:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 34
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    .line 35
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    .line 36
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    .line 37
    return-void
.end method

.method private setDiList(Lorg/w3c/dom/NodeList;)Z
    .locals 10
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    const/4 v6, 0x0

    .line 92
    if-nez p1, :cond_1

    .line 121
    :cond_0
    :goto_0
    return v6

    .line 95
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    .line 96
    .local v2, "listLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, v2, :cond_2

    .line 121
    const/4 v6, 0x1

    goto :goto_0

    .line 98
    :cond_2
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 99
    .local v1, "item":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "row"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 101
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 102
    .local v5, "recordList":Lorg/w3c/dom/NodeList;
    if-nez v5, :cond_3

    .line 104
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_0

    const-string v7, "ResGetDIUsableList"

    const-string v8, "DiList == null"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 108
    :cond_3
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    .line 109
    .local v4, "recordLen":I
    if-gtz v4, :cond_4

    .line 112
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_0

    const-string v7, "ResGetDIUsableList"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "DiList count : "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 115
    :cond_4
    new-instance v3, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;

    invoke-direct {v3}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;-><init>()V

    .line 116
    .local v3, "record":Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;
    invoke-virtual {v3, v5}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->searchRecordTag(Lorg/w3c/dom/NodeList;)V

    .line 118
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->getRecord()Ljava/util/Vector;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 96
    .end local v3    # "record":Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;
    .end local v4    # "recordLen":I
    .end local v5    # "recordList":Lorg/w3c/dom/NodeList;
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public clear()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 41
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    .line 42
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    .line 43
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    if-eqz v3, :cond_0

    .line 45
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 46
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v2, :cond_1

    .line 56
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->clear()V

    .line 57
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    .line 59
    .end local v0    # "i":I
    .end local v2    # "size":I
    :cond_0
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 60
    return-void

    .line 48
    .restart local v0    # "i":I
    .restart local v2    # "size":I
    :cond_1
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;

    .line 49
    .local v1, "record":Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;
    if-eqz v1, :cond_2

    .line 51
    invoke-virtual {v1}, Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;->clear()V

    .line 46
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    return-object v0
.end method

.method public getListNum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    return-object v0
.end method

.method public getRecord()Ljava/util/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Lcom/kt/olleh/inapp/net/ResDIListExpandRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mRecord:Ljava/util/Vector;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 64
    if-nez p1, :cond_1

    .line 87
    :cond_0
    :goto_0
    return v1

    .line 67
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 71
    const-string v3, "app_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 73
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    .line 74
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->toString()Ljava/lang/String;

    move v1, v2

    .line 75
    goto :goto_0

    .line 77
    :cond_2
    const-string v3, "list_num"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 79
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    .line 80
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->toString()Ljava/lang/String;

    move v1, v2

    .line 81
    goto :goto_0

    .line 83
    :cond_3
    const-string v2, "di_list"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 85
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/kt/olleh/inapp/net/ResDIListExpand;->setDiList(Lorg/w3c/dom/NodeList;)Z

    goto :goto_0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appid"    # Ljava/lang/String;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    .line 138
    return-void
.end method

.method public setDiTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "dititle"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    .line 148
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

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mApp_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    const-string v1, "list_num"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIListExpand;->mList_num:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
