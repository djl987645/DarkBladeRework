.class Lcom/beyond/sui/SUIBtnList;
.super Lcom/beyond/sui/SUIBase;
.source "SUIBtnList.java"


# static fields
.field private static final LANDSCAPE:I = 0x1

.field private static final VERTICAL:I


# instance fields
.field private buttonSelected:Lcom/beyond/sui/SUIButton;

.field private button_c:Lcom/beyond/sui/SUIButton;

.field private buttons:Ljava/util/Vector;

.field private current:I

.field private direction:I

.field private is_draw_selected_first:Z

.field private is_draw_selected_rect:Z

.field private is_one_click:Z

.field private is_send_arrow_event:Z


# direct methods
.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 20
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 24
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIBtnList;->buttons:Ljava/util/Vector;

    .line 25
    iput-object v2, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    .line 27
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    .line 28
    iput v1, p0, Lcom/beyond/sui/SUIBtnList;->direction:I

    .line 29
    iput v1, p0, Lcom/beyond/sui/SUIBtnList;->current:I

    .line 30
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_rect:Z

    .line 31
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_send_arrow_event:Z

    .line 32
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_first:Z

    .line 34
    iput-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    .line 20
    return-void
.end method


# virtual methods
.method getSelectedValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    if-eqz v0, :cond_0

    .line 176
    iget-object v0, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget-object v0, v0, Lcom/beyond/sui/SUIButton;->value:Ljava/lang/String;

    .line 177
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 3
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 84
    const-string v1, "is_one_click"

    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    invoke-static {p1, v1, v2}, Lcom/beyond/sui/SUIBtnList;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    .line 85
    const-string v1, "current"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/beyond/sui/SUIBtnList;->current:I

    .line 86
    const-string v1, "is_draw_selected_rect"

    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_rect:Z

    invoke-static {p1, v1, v2}, Lcom/beyond/sui/SUIBtnList;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_rect:Z

    .line 87
    const-string v1, "is_send_arrow_event"

    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_send_arrow_event:Z

    invoke-static {p1, v1, v2}, Lcom/beyond/sui/SUIBtnList;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_send_arrow_event:Z

    .line 88
    const-string v1, "is_draw_selected_first"

    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_first:Z

    invoke-static {p1, v1, v2}, Lcom/beyond/sui/SUIBtnList;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_first:Z

    .line 90
    const-string v1, "direction"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "str":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 92
    const-string v1, "VERTICAL"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    const/4 v1, 0x0

    iput v1, p0, Lcom/beyond/sui/SUIBtnList;->direction:I

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    const-string v1, "LANDSCAPE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    const/4 v1, 0x1

    iput v1, p0, Lcom/beyond/sui/SUIBtnList;->direction:I

    goto :goto_0
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 7
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v6, 0x0

    .line 59
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v3

    .line 60
    .local v3, "v":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .local v2, "en":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_2

    .line 77
    iget-boolean v4, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    if-nez v4, :cond_1

    .line 78
    iget v4, p0, Lcom/beyond/sui/SUIBtnList;->current:I

    invoke-virtual {p0, v4}, Lcom/beyond/sui/SUIBtnList;->setSelectedIndex(I)Z

    .line 79
    :cond_1
    const/4 v4, 0x1

    return v4

    .line 61
    :cond_2
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnanoxml/XMLElement;

    .line 62
    .local v1, "el":Lnanoxml/XMLElement;
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "button"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 63
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 64
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    iget-boolean v4, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    if-nez v4, :cond_3

    .line 65
    iput-boolean v6, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 66
    :cond_3
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 67
    iget-object v4, p0, Lcom/beyond/sui/SUIBtnList;->buttons:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 69
    .end local v0    # "c":Lcom/beyond/sui/SUIButton;
    :cond_4
    invoke-virtual {v1}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "button_c"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 70
    new-instance v0, Lcom/beyond/sui/SUIButton;

    invoke-direct {v0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 71
    .restart local v0    # "c":Lcom/beyond/sui/SUIButton;
    iput-boolean v6, v0, Lcom/beyond/sui/SUIButton;->isSendEvent:Z

    .line 72
    invoke-virtual {v0, v1, p0}, Lcom/beyond/sui/SUIButton;->make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 73
    iput-object v0, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 4
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 38
    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_first:Z

    if-eqz v2, :cond_0

    .line 39
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    if-eqz v2, :cond_0

    .line 40
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    iget-object v3, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget-object v3, v3, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iput-object v3, v2, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    .line 41
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v2, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 45
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->buttons:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-lt v1, v2, :cond_2

    .line 50
    iget-boolean v2, p0, Lcom/beyond/sui/SUIBtnList;->is_draw_selected_first:Z

    if-nez v2, :cond_1

    .line 51
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    if-eqz v2, :cond_1

    .line 52
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    iget-object v3, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    iget-object v3, v3, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    iput-object v3, v2, Lcom/beyond/sui/SUIButton;->rect:Landroid/graphics/Rect;

    .line 53
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->button_c:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v2, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 56
    :cond_1
    return-void

    .line 46
    :cond_2
    iget-object v2, p0, Lcom/beyond/sui/SUIBtnList;->buttons:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 47
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 45
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method setSelectedIndex(I)Z
    .locals 2
    .param p1, "ix"    # I

    .prologue
    .line 181
    iget-boolean v1, p0, Lcom/beyond/sui/SUIBtnList;->is_one_click:Z

    if-eqz v1, :cond_0

    .line 182
    const/4 v1, 0x0

    .line 187
    :goto_0
    return v1

    .line 184
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/SUIBtnList;->buttons:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIButton;

    .line 185
    .local v0, "c":Lcom/beyond/sui/SUIButton;
    iput-object v0, p0, Lcom/beyond/sui/SUIBtnList;->buttonSelected:Lcom/beyond/sui/SUIButton;

    .line 187
    const/4 v1, 0x1

    goto :goto_0
.end method
