.class public Lcom/kt/olleh/inapp/net/ResDIList;
.super Lcom/kt/olleh/inapp/net/Response;
.source "ResDIList.java"


# instance fields
.field public mApp_id:Ljava/lang/String;

.field public mList_num:Ljava/lang/String;

.field private mRecord:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lcom/kt/olleh/inapp/net/ResDIListRecord;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Lcom/kt/olleh/inapp/net/Response;-><init>()V

    .line 39
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    .line 42
    return-void
.end method

.method private setDiList(Lorg/w3c/dom/NodeList;)Z
    .locals 10
    .param p1, "list"    # Lorg/w3c/dom/NodeList;

    .prologue
    const/4 v6, 0x0

    .line 95
    if-nez p1, :cond_1

    .line 124
    :cond_0
    :goto_0
    return v6

    .line 98
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v2

    .line 99
    .local v2, "listLen":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-lt v0, v2, :cond_2

    .line 124
    const/4 v6, 0x1

    goto :goto_0

    .line 101
    :cond_2
    invoke-interface {p1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 102
    .local v1, "item":Lorg/w3c/dom/Node;
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "row"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 104
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    .line 105
    .local v5, "recordList":Lorg/w3c/dom/NodeList;
    if-nez v5, :cond_3

    .line 107
    sget-boolean v7, Lcom/kt/olleh/inapp/Config/Config;->DEBUG:Z

    if-eqz v7, :cond_0

    const-string v7, "ResGetDIUsableList"

    const-string v8, "DiList == null"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 111
    :cond_3
    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    .line 112
    .local v4, "recordLen":I
    if-gtz v4, :cond_4

    .line 115
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

    .line 118
    :cond_4
    new-instance v3, Lcom/kt/olleh/inapp/net/ResDIListRecord;

    invoke-direct {v3}, Lcom/kt/olleh/inapp/net/ResDIListRecord;-><init>()V

    .line 119
    .local v3, "record":Lcom/kt/olleh/inapp/net/ResDIListRecord;
    invoke-virtual {v3, v5}, Lcom/kt/olleh/inapp/net/ResDIListRecord;->searchRecordTag(Lorg/w3c/dom/NodeList;)V

    .line 121
    invoke-virtual {p0}, Lcom/kt/olleh/inapp/net/ResDIList;->getRecord()Ljava/util/Vector;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 99
    .end local v3    # "record":Lcom/kt/olleh/inapp/net/ResDIListRecord;
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

    .line 46
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    .line 47
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    .line 48
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    if-eqz v3, :cond_0

    .line 50
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v2

    .line 51
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v2, :cond_1

    .line 61
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->clear()V

    .line 62
    iput-object v4, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    .line 64
    .end local v0    # "i":I
    .end local v2    # "size":I
    :cond_0
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->clear()V

    .line 65
    return-void

    .line 53
    .restart local v0    # "i":I
    .restart local v2    # "size":I
    :cond_1
    iget-object v3, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/kt/olleh/inapp/net/ResDIListRecord;

    .line 54
    .local v1, "record":Lcom/kt/olleh/inapp/net/ResDIListRecord;
    if-eqz v1, :cond_2

    .line 56
    invoke-virtual {v1}, Lcom/kt/olleh/inapp/net/ResDIListRecord;->clear()V

    .line 51
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    return-object v0
.end method

.method public getListNum()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    return-object v0
.end method

.method public getRecord()Ljava/util/Vector;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Vector",
            "<",
            "Lcom/kt/olleh/inapp/net/ResDIListRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mRecord:Ljava/util/Vector;

    return-object v0
.end method

.method protected searchValueTag(Lorg/w3c/dom/Node;)Z
    .locals 4
    .param p1, "item"    # Lorg/w3c/dom/Node;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 69
    if-nez p1, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v1

    .line 72
    :cond_1
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 76
    const-string v3, "app_id"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 78
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIList;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    move v1, v2

    .line 79
    goto :goto_0

    .line 81
    :cond_2
    const-string v3, "list_num"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 83
    invoke-static {p1}, Lcom/kt/olleh/inapp/net/ResDIList;->getValue(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    move v1, v2

    .line 84
    goto :goto_0

    .line 86
    :cond_3
    const-string v2, "di_list"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/kt/olleh/inapp/net/ResDIList;->setDiList(Lorg/w3c/dom/NodeList;)Z

    goto :goto_0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appid"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    .line 141
    return-void
.end method

.method public setDiTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "dititle"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 155
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 157
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-super {p0}, Lcom/kt/olleh/inapp/net/Response;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 159
    const-string v1, "app_id"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mApp_id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const-string v1, "list_num"

    iget-object v2, p0, Lcom/kt/olleh/inapp/net/ResDIList;->mList_num:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/kt/olleh/inapp/util/Util;->addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
