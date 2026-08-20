.class public Lcom/beyond/sui/SUIWeb;
.super Lcom/beyond/sui/SUIBase;
.source "SUIWeb.java"


# instance fields
.field url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 16
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/sui/SUIWeb;->url:Ljava/lang/String;

    .line 15
    return-void
.end method


# virtual methods
.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 2
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 27
    const-string v0, "url"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUIWeb;->url:Ljava/lang/String;

    .line 28
    iget-object v0, p0, Lcom/beyond/sui/SUIWeb;->url:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/beyond/sui/SUIWeb;->url:Ljava/lang/String;

    iget-object v1, p0, Lcom/beyond/sui/SUIWeb;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v0, v1}, Lcom/beyond/sui/SUIWeb;->requestCreate(Ljava/lang/String;Landroid/graphics/Rect;)V

    .line 31
    :cond_0
    return-void
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 1
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 22
    const/4 v0, 0x1

    return v0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p1, "componentType"    # I
    .param p2, "n"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 50
    if-eqz p2, :cond_1

    iget-object v3, p0, Lcom/beyond/sui/SUIWeb;->name:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/beyond/sui/SUIWeb;->name:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 51
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 52
    .local v0, "msg":Landroid/os/Message;
    new-instance v1, Lcom/beyond/util/MessageInfo;

    invoke-direct {v1}, Lcom/beyond/util/MessageInfo;-><init>()V

    .line 53
    .local v1, "msgInfo":Lcom/beyond/util/MessageInfo;
    iput v2, v1, Lcom/beyond/util/MessageInfo;->command:I

    .line 55
    const-string v2, "show"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 56
    const/4 v2, 0x2

    iput v2, v1, Lcom/beyond/util/MessageInfo;->subCommand:I

    .line 61
    :cond_0
    :goto_0
    const/16 v2, 0x12c

    iput v2, v0, Landroid/os/Message;->what:I

    .line 62
    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 64
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 65
    const/4 v2, 0x1

    .line 67
    .end local v0    # "msg":Landroid/os/Message;
    .end local v1    # "msgInfo":Lcom/beyond/util/MessageInfo;
    :cond_1
    return v2

    .line 58
    .restart local v0    # "msg":Landroid/os/Message;
    .restart local v1    # "msgInfo":Lcom/beyond/util/MessageInfo;
    :cond_2
    const-string v2, "hide"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 59
    const/4 v2, 0x3

    iput v2, v1, Lcom/beyond/util/MessageInfo;->subCommand:I

    goto :goto_0
.end method

.method protected requestCreate(Ljava/lang/String;Landroid/graphics/Rect;)V
    .locals 3
    .param p1, "u"    # Ljava/lang/String;
    .param p2, "rc"    # Landroid/graphics/Rect;

    .prologue
    const/4 v2, 0x0

    .line 34
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 35
    .local v0, "msg":Landroid/os/Message;
    new-instance v1, Lcom/beyond/util/MessageInfo;

    invoke-direct {v1}, Lcom/beyond/util/MessageInfo;-><init>()V

    .line 37
    .local v1, "msgInfo":Lcom/beyond/util/MessageInfo;
    iput v2, v1, Lcom/beyond/util/MessageInfo;->command:I

    .line 38
    iput v2, v1, Lcom/beyond/util/MessageInfo;->subCommand:I

    .line 39
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, p2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v2, v1, Lcom/beyond/util/MessageInfo;->rc:Landroid/graphics/Rect;

    .line 40
    iput-object p1, v1, Lcom/beyond/util/MessageInfo;->stringValue:Ljava/lang/String;

    .line 42
    const/16 v2, 0x12c

    iput v2, v0, Landroid/os/Message;->what:I

    .line 43
    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 45
    invoke-static {}, Lcom/beyond/BeyondActivity;->getHandler2()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 46
    return-void
.end method
