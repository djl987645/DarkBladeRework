.class Lcom/beyond/sui/SUIList;
.super Lcom/beyond/sui/SUIBase;
.source "SUIList.java"


# static fields
.field private static final LANDSCAPE:I = 0x1

.field private static final VERTICAL:I


# instance fields
.field private button_c:Lcom/beyond/sui/SUIButton;

.field private button_e:Lcom/beyond/sui/SUIButton;

.field private button_s:Lcom/beyond/sui/SUIButton;

.field private center_ix:I

.field private current:I

.field private direction:I

.field private display_item_count:I

.field private inset:I

.field private isDrawSelectedRect:Z

.field private isRotation:Z

.field private is_send_arrow_event:Z

.field private itemRect:Landroid/graphics/Rect;

.field private item_h:I

.field private item_w:I

.field private items:Ljava/util/Vector;

.field private space:I

.field private text:Lcom/beyond/sui/SUIText;

.field private texts:[Lcom/beyond/sui/SUIText;


# direct methods
.method constructor <init>()V
    .locals 5

    .prologue
    const/16 v4, 0x32

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 16
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    .line 21
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    .line 22
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->itemRect:Landroid/graphics/Rect;

    .line 23
    iput-boolean v3, p0, Lcom/beyond/sui/SUIList;->isRotation:Z

    .line 24
    iput-boolean v1, p0, Lcom/beyond/sui/SUIList;->isDrawSelectedRect:Z

    .line 25
    iput v3, p0, Lcom/beyond/sui/SUIList;->display_item_count:I

    .line 26
    iput v1, p0, Lcom/beyond/sui/SUIList;->direction:I

    .line 27
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->text:Lcom/beyond/sui/SUIText;

    .line 28
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->button_s:Lcom/beyond/sui/SUIButton;

    .line 29
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->button_e:Lcom/beyond/sui/SUIButton;

    .line 30
    iput-boolean v1, p0, Lcom/beyond/sui/SUIList;->is_send_arrow_event:Z

    .line 32
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->button_c:Lcom/beyond/sui/SUIButton;

    .line 35
    iput v1, p0, Lcom/beyond/sui/SUIList;->current:I

    .line 37
    iput-object v2, p0, Lcom/beyond/sui/SUIList;->texts:[Lcom/beyond/sui/SUIText;

    .line 38
    iput v4, p0, Lcom/beyond/sui/SUIList;->item_w:I

    .line 39
    iput v4, p0, Lcom/beyond/sui/SUIList;->item_h:I

    .line 40
    iput v1, p0, Lcom/beyond/sui/SUIList;->inset:I

    .line 41
    const/4 v0, 0x6

    iput v0, p0, Lcom/beyond/sui/SUIList;->space:I

    .line 42
    iput v1, p0, Lcom/beyond/sui/SUIList;->center_ix:I

    .line 16
    return-void
.end method


# virtual methods
.method getSelectedValue()Ljava/lang/String;
    .locals 3

    .prologue
    .line 158
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    iget v2, p0, Lcom/beyond/sui/SUIList;->current:I

    invoke-virtual {v1, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIListItem;

    .line 159
    .local v0, "currentItem":Lcom/beyond/sui/SUIListItem;
    iget-object v1, v0, Lcom/beyond/sui/SUIListItem;->value:Ljava/lang/String;

    return-object v1
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 2
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 45
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget v1, p0, Lcom/beyond/sui/SUIList;->display_item_count:I

    if-lt v0, v1, :cond_3

    .line 47
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_s:Lcom/beyond/sui/SUIButton;

    if-eqz v1, :cond_0

    .line 48
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_s:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 49
    :cond_0
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_e:Lcom/beyond/sui/SUIButton;

    if-eqz v1, :cond_1

    .line 50
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_e:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 51
    :cond_1
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_c:Lcom/beyond/sui/SUIButton;

    if-eqz v1, :cond_2

    .line 52
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->button_c:Lcom/beyond/sui/SUIButton;

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIButton;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 53
    :cond_2
    return-void

    .line 46
    :cond_3
    iget-object v1, p0, Lcom/beyond/sui/SUIList;->texts:[Lcom/beyond/sui/SUIText;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2, p3}, Lcom/beyond/sui/SUIText;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 45
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method setCurrent(I)V
    .locals 5
    .param p1, "ix"    # I

    .prologue
    .line 130
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt p1, v3, :cond_0

    .line 131
    const/4 v3, 0x0

    iput v3, p0, Lcom/beyond/sui/SUIList;->current:I

    .line 137
    :goto_0
    iget v2, p0, Lcom/beyond/sui/SUIList;->current:I

    .line 138
    .local v2, "s":I
    iget v0, p0, Lcom/beyond/sui/SUIList;->center_ix:I

    .local v0, "i":I
    :goto_1
    iget v3, p0, Lcom/beyond/sui/SUIList;->display_item_count:I

    if-lt v0, v3, :cond_2

    .line 146
    iget v3, p0, Lcom/beyond/sui/SUIList;->current:I

    add-int/lit8 v2, v3, -0x1

    .line 147
    iget v3, p0, Lcom/beyond/sui/SUIList;->center_ix:I

    add-int/lit8 v0, v3, -0x1

    :goto_2
    if-gez v0, :cond_4

    .line 155
    return-void

    .line 132
    .end local v0    # "i":I
    .end local v2    # "s":I
    :cond_0
    if-gez p1, :cond_1

    .line 133
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/beyond/sui/SUIList;->current:I

    goto :goto_0

    .line 135
    :cond_1
    iput p1, p0, Lcom/beyond/sui/SUIList;->current:I

    goto :goto_0

    .line 140
    .restart local v0    # "i":I
    .restart local v2    # "s":I
    :cond_2
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/beyond/sui/SUIListItem;

    .line 141
    .local v1, "item":Lcom/beyond/sui/SUIListItem;
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->texts:[Lcom/beyond/sui/SUIText;

    aget-object v3, v3, v0

    iget-object v4, v1, Lcom/beyond/sui/SUIListItem;->str:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    .line 142
    add-int/lit8 v2, v2, 0x1

    .line 143
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lt v2, v3, :cond_3

    .line 144
    const/4 v2, 0x0

    .line 138
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 148
    .end local v1    # "item":Lcom/beyond/sui/SUIListItem;
    :cond_4
    if-gez v2, :cond_5

    .line 149
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 151
    :cond_5
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->items:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/beyond/sui/SUIListItem;

    .line 152
    .restart local v1    # "item":Lcom/beyond/sui/SUIListItem;
    iget-object v3, p0, Lcom/beyond/sui/SUIList;->texts:[Lcom/beyond/sui/SUIText;

    aget-object v3, v3, v0

    iget-object v4, v1, Lcom/beyond/sui/SUIListItem;->str:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/beyond/sui/SUIText;->setText(Ljava/lang/String;)V

    .line 153
    add-int/lit8 v2, v2, -0x1

    .line 147
    add-int/lit8 v0, v0, -0x1

    goto :goto_2
.end method

.method setSelectedIndex(I)Z
    .locals 1
    .param p1, "ix"    # I

    .prologue
    .line 163
    invoke-virtual {p0, p1}, Lcom/beyond/sui/SUIList;->setCurrent(I)V

    .line 164
    const/4 v0, 0x1

    return v0
.end method
