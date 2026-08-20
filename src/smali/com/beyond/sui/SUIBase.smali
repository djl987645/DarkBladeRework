.class public Lcom/beyond/sui/SUIBase;
.super Ljava/lang/Object;
.source "SUIBase.java"


# static fields
.field static final DBG_COMP:I = 0x1

.field static final DBG_NONE:I = 0x0

.field static final DBG_VIEW:I = 0x2

.field static final KEY_PRESSED:I = 0x1

.field static final KEY_RELEASED:I = 0x2

.field static final POINT_MOVED:I = 0x5

.field static final POINT_PRESSED:I = 0x1

.field static final POINT_RELEASED:I = 0x2

.field static final RESULTE_HIDE_ALL:I = 0x4

.field static final RESULTE_HIDE_NONE:I = 0x1

.field static final RESULTE_HIDE_THIS:I = 0x2

.field static final RESULTE_NONE:I

.field static debug_level:I


# instance fields
.field alpha:I

.field color:I

.field private fade_current:I

.field private fade_value:I

.field gap_height:I

.field gap_width:I

.field protected isVisible:Z

.field is_effect:Z

.field is_enlarge:Z

.field is_flick:Z

.field is_show:Z

.field name:Ljava/lang/String;

.field protected parent:Lcom/beyond/sui/SUIBase;

.field rect:Landroid/graphics/Rect;

.field scalex:I

.field scaley:I

.field value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    sput v0, Lcom/beyond/sui/SUIBase;->debug_level:I

    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 5

    .prologue
    const/16 v4, 0x64

    const/4 v3, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object v1, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    .line 40
    iput v3, p0, Lcom/beyond/sui/SUIBase;->color:I

    .line 41
    iput v3, p0, Lcom/beyond/sui/SUIBase;->alpha:I

    .line 42
    iput-object v1, p0, Lcom/beyond/sui/SUIBase;->value:Ljava/lang/String;

    .line 43
    iput-object v1, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    .line 45
    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_flick:Z

    .line 46
    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_enlarge:Z

    .line 47
    iput v0, p0, Lcom/beyond/sui/SUIBase;->gap_width:I

    .line 48
    iput v0, p0, Lcom/beyond/sui/SUIBase;->gap_height:I

    .line 50
    iput v0, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    .line 51
    iput v0, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    .line 53
    iput-boolean v2, p0, Lcom/beyond/sui/SUIBase;->is_show:Z

    .line 54
    iput-boolean v2, p0, Lcom/beyond/sui/SUIBase;->is_effect:Z

    .line 58
    iput-object v1, p0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    .line 60
    iput-boolean v2, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    .line 62
    iput v4, p0, Lcom/beyond/sui/SUIBase;->scalex:I

    .line 63
    iput v4, p0, Lcom/beyond/sui/SUIBase;->scaley:I

    .line 22
    return-void
.end method

.method protected static createBitmap(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 97
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 98
    .local v1, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 99
    invoke-static {p0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 103
    .local v0, "bm":Landroid/graphics/Bitmap;
    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 105
    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 107
    invoke-static {p0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 110
    if-nez v0, :cond_0

    .line 112
    :try_start_0
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "len:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    :goto_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "malforamtted"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 120
    :cond_0
    return-object v0

    .line 114
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method static getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z
    .locals 2
    .param p0, "el"    # Lnanoxml/XMLElement;
    .param p1, "attr"    # Ljava/lang/String;
    .param p2, "defaut_value"    # Z

    .prologue
    .line 156
    invoke-virtual {p0, p1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, "str":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 161
    .end local p2    # "defaut_value":Z
    :goto_0
    return p2

    .line 159
    .restart local p2    # "defaut_value":Z
    :cond_0
    const-string v1, "YES"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 160
    const/4 p2, 0x1

    goto :goto_0

    .line 161
    :cond_1
    const/4 p2, 0x0

    goto :goto_0
.end method

.method protected static getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-static {p0}, Lcom/beyond/sui/SUImanager;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public static loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 67
    const/4 v1, 0x0

    .line 68
    .local v1, "image":Landroid/graphics/Bitmap;
    if-nez p0, :cond_1

    .line 88
    :cond_0
    :goto_0
    return-object v3

    .line 71
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    .line 74
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-eq v3, v4, :cond_2

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 76
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "res_pad"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 79
    const/4 v2, 0x0

    .line 80
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-static {p0}, Lcom/beyond/sui/SUIBase;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 82
    invoke-static {v2}, Lcom/beyond/sui/SUIBase;->createBitmap(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    move-object v3, v1

    .line 88
    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private makeAttr_s(Lnanoxml/XMLElement;)V
    .locals 2
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 196
    const-string v0, "alpha"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIBase;->alpha:I

    .line 197
    const-string v0, "is_flick"

    iget-boolean v1, p0, Lcom/beyond/sui/SUIBase;->is_flick:Z

    invoke-static {p1, v0, v1}, Lcom/beyond/sui/SUIBase;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_flick:Z

    .line 198
    const-string v0, "is_enlarge"

    iget-boolean v1, p0, Lcom/beyond/sui/SUIBase;->is_enlarge:Z

    invoke-static {p1, v0, v1}, Lcom/beyond/sui/SUIBase;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_enlarge:Z

    .line 200
    const-string v0, "visible"

    iget-boolean v1, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    invoke-static {p1, v0, v1}, Lcom/beyond/sui/SUIBase;->getBoolean(Lnanoxml/XMLElement;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    .line 202
    const-string v0, "gap_width"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIBase;->gap_width:I

    .line 203
    const-string v0, "gap_height"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIBase;->gap_height:I

    .line 205
    const-string v0, "fade_value"

    invoke-virtual {p1, v0}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    .line 206
    iget v0, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    if-gez v0, :cond_1

    .line 207
    const/16 v0, -0xfa

    iput v0, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    .line 211
    :cond_0
    :goto_0
    invoke-virtual {p0, p1}, Lcom/beyond/sui/SUIBase;->makeAttr(Lnanoxml/XMLElement;)V

    .line 212
    return-void

    .line 208
    :cond_1
    iget v0, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    if-lez v0, :cond_0

    .line 209
    const/4 v0, 0x1

    iput v0, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    goto :goto_0
.end method


# virtual methods
.method protected drawDebug(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .locals 1
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 328
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2}, Lcom/beyond/sui/SUIBase;->drawDebug(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 329
    return-void
.end method

.method protected drawDebug(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 1
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/beyond/sui/SUIBase;->drawDebug(Landroid/graphics/Canvas;Landroid/graphics/Rect;Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 337
    return-void
.end method

.method protected drawDebug(Landroid/graphics/Canvas;Landroid/graphics/Rect;Ljava/lang/String;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "msg"    # Ljava/lang/String;
    .param p4, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/16 v1, 0xff

    .line 340
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 341
    .local v0, "paintd":Landroid/graphics/Paint;
    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 342
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 343
    if-eqz p2, :cond_0

    .line 344
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 345
    :cond_0
    if-eqz p3, :cond_1

    .line 349
    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, p2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    invoke-virtual {p1, p3, v1, v2, v0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 351
    :cond_1
    return-void
.end method

.method protected drawDebug(Landroid/graphics/Canvas;Ljava/lang/String;Landroid/graphics/Paint;)V
    .locals 1
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 332
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0, p2, p3}, Lcom/beyond/sui/SUIBase;->drawDebug(Landroid/graphics/Canvas;Landroid/graphics/Rect;Ljava/lang/String;Landroid/graphics/Paint;)V

    .line 333
    return-void
.end method

.method getAbsoluteRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "defaultRect"    # Landroid/graphics/Rect;

    .prologue
    .line 134
    if-nez p1, :cond_0

    .line 144
    .end local p2    # "defaultRect":Landroid/graphics/Rect;
    :goto_0
    return-object p2

    .line 137
    .restart local p2    # "defaultRect":Landroid/graphics/Rect;
    :cond_0
    if-nez p2, :cond_1

    move-object p2, p1

    .line 138
    goto :goto_0

    .line 139
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 140
    .local v0, "retRect":Landroid/graphics/Rect;
    iget v1, p2, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->left:I

    .line 141
    iget v1, p2, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 142
    iget v1, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 143
    iget v1, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    move-object p2, v0

    .line 144
    goto :goto_0
.end method

.method getColor(Lnanoxml/XMLElement;)I
    .locals 4
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 149
    const-string v3, "red"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    .line 150
    .local v2, "r":I
    const-string v3, "green"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v1

    .line 151
    .local v1, "g":I
    const-string v3, "blue"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 152
    .local v0, "b":I
    invoke-static {v2, v1, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    return v3
.end method

.method protected getNameStr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected getParentView()Lcom/beyond/sui/SUIView;
    .locals 2

    .prologue
    .line 370
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    .line 371
    .local v0, "p":Lcom/beyond/sui/SUIBase;
    :goto_0
    if-nez v0, :cond_0

    .line 376
    check-cast v0, Lcom/beyond/sui/SUIView;

    .end local v0    # "p":Lcom/beyond/sui/SUIBase;
    :goto_1
    return-object v0

    .line 372
    .restart local v0    # "p":Lcom/beyond/sui/SUIBase;
    :cond_0
    iget-object v1, v0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    if-ne v0, v1, :cond_1

    .line 373
    check-cast v0, Lcom/beyond/sui/SUIView;

    goto :goto_1

    .line 374
    :cond_1
    iget-object v0, v0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    goto :goto_0
.end method

.method getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;
    .locals 7
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 125
    const-string v4, "x"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    .line 126
    .local v2, "x":I
    const-string v4, "y"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v3

    .line 127
    .local v3, "y":I
    const-string v4, "width"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v1

    .line 128
    .local v1, "w":I
    const-string v4, "height"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v0

    .line 129
    .local v0, "h":I
    new-instance v4, Landroid/graphics/Rect;

    add-int v5, v2, v1

    add-int v6, v3, v0

    invoke-direct {v4, v2, v3, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v4
.end method

.method public getSUIBaseByName(Ljava/lang/String;)Lcom/beyond/sui/SUIBase;
    .locals 1
    .param p1, "suiName"    # Ljava/lang/String;

    .prologue
    .line 393
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    .end local p0    # "this":Lcom/beyond/sui/SUIBase;
    :goto_0
    return-object p0

    .restart local p0    # "this":Lcom/beyond/sui/SUIBase;
    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method

.method protected getScaledRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4
    .param p1, "r"    # Landroid/graphics/Rect;

    .prologue
    const/16 v3, 0x64

    .line 380
    invoke-virtual {p0}, Lcom/beyond/sui/SUIBase;->getParentView()Lcom/beyond/sui/SUIView;

    move-result-object v1

    .line 381
    .local v1, "v":Lcom/beyond/sui/SUIView;
    iget v2, v1, Lcom/beyond/sui/SUIView;->scalex:I

    if-ne v2, v3, :cond_0

    iget v2, v1, Lcom/beyond/sui/SUIView;->scaley:I

    if-ne v2, v3, :cond_0

    .line 388
    .end local p1    # "r":Landroid/graphics/Rect;
    :goto_0
    return-object p1

    .line 383
    .restart local p1    # "r":Landroid/graphics/Rect;
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 384
    .local v0, "ret":Landroid/graphics/Rect;
    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, v1, Lcom/beyond/sui/SUIView;->scalex:I

    mul-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x64

    iput v2, v0, Landroid/graphics/Rect;->right:I

    .line 385
    iget v2, p1, Landroid/graphics/Rect;->bottom:I

    iget v3, v1, Lcom/beyond/sui/SUIView;->scaley:I

    mul-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x64

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 386
    iget v2, p1, Landroid/graphics/Rect;->left:I

    iget v3, v1, Lcom/beyond/sui/SUIView;->scalex:I

    mul-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x64

    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 387
    iget v2, p1, Landroid/graphics/Rect;->top:I

    iget v3, v1, Lcom/beyond/sui/SUIView;->scaley:I

    mul-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x64

    iput v2, v0, Landroid/graphics/Rect;->top:I

    move-object p1, v0

    .line 388
    goto :goto_0
.end method

.method protected getValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 354
    invoke-virtual {p0, p1, p2}, Lcom/beyond/sui/SUIBase;->onGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getValueStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 223
    if-nez p1, :cond_1

    .line 229
    :cond_0
    :goto_0
    return-object v0

    .line 225
    :cond_1
    iget-object v1, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 227
    iget-object v1, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 229
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->value:Ljava/lang/String;

    goto :goto_0
.end method

.method protected isDebug(I)Z
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 324
    const/4 v0, 0x0

    return v0
.end method

.method final make(Lnanoxml/XMLElement;Lcom/beyond/sui/SUIBase;)Z
    .locals 5
    .param p1, "xml"    # Lnanoxml/XMLElement;
    .param p2, "p"    # Lcom/beyond/sui/SUIBase;

    .prologue
    .line 165
    iput-object p2, p0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    .line 166
    const-string v3, "name"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    .line 167
    const-string v3, "value"

    invoke-virtual {p1, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/sui/SUIBase;->value:Ljava/lang/String;

    .line 169
    if-eqz p2, :cond_0

    iget-object v3, p2, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    if-eqz v3, :cond_0

    .line 170
    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    iget-object v4, v4, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v3, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    .line 173
    :cond_0
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 174
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-nez v3, :cond_2

    .line 188
    invoke-virtual {p0, p1}, Lcom/beyond/sui/SUIBase;->makeContent(Lnanoxml/XMLElement;)Z

    move-result v3

    return v3

    .line 175
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 176
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "rect"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 177
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIBase;->getRect(Lnanoxml/XMLElement;)Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/beyond/sui/SUIBase;->getScaledRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    .line 178
    if-eqz p2, :cond_1

    .line 179
    iget-object v3, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/beyond/sui/SUIBase;->parent:Lcom/beyond/sui/SUIBase;

    iget-object v4, v4, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v3, v4}, Lcom/beyond/sui/SUIBase;->getAbsoluteRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v3

    iput-object v3, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    goto :goto_0

    .line 181
    :cond_3
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "color"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 182
    invoke-virtual {p0, v0}, Lcom/beyond/sui/SUIBase;->getColor(Lnanoxml/XMLElement;)I

    move-result v3

    iput v3, p0, Lcom/beyond/sui/SUIBase;->color:I

    goto :goto_0

    .line 184
    :cond_4
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "attr"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 185
    invoke-direct {p0, v0}, Lcom/beyond/sui/SUIBase;->makeAttr_s(Lnanoxml/XMLElement;)V

    goto :goto_0
.end method

.method protected makeAttr(Lnanoxml/XMLElement;)V
    .locals 0
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 216
    return-void
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 1
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    .line 192
    const/4 v0, 0x0

    return v0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 1
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "cRect"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    .line 318
    const/4 v0, 0x0

    return v0
.end method

.method protected onGetValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 362
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onSetValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 366
    const/4 v0, 0x0

    return v0
.end method

.method final onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "cRect"    # Landroid/graphics/Rect;
    .param p3, "state"    # I
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    .line 311
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, p3, p1, v0, p4}, Lcom/beyond/sui/SUIBase;->mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I

    move-result v0

    if-lez v0, :cond_0

    .line 312
    const/4 v0, 0x1

    .line 314
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "cRect"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 272
    iget-boolean v0, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    if-nez v0, :cond_0

    .line 297
    :goto_0
    return-void

    .line 275
    :cond_0
    iget-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_flick:Z

    if-eqz v0, :cond_2

    .line 276
    iget-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_show:Z

    if-eqz v0, :cond_1

    .line 277
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBase;->is_show:Z

    goto :goto_0

    .line 281
    :cond_1
    iput-boolean v2, p0, Lcom/beyond/sui/SUIBase;->is_show:Z

    .line 284
    :cond_2
    iget-boolean v0, p0, Lcom/beyond/sui/SUIBase;->is_effect:Z

    if-eqz v0, :cond_3

    .line 285
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBase;->is_effect:Z

    .line 294
    :goto_1
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/sui/SUIBase;->paintBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 295
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/sui/SUIBase;->paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 296
    iget-object v0, p0, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/sui/SUIBase;->paintAfter(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0

    .line 287
    :cond_3
    iput-boolean v2, p0, Lcom/beyond/sui/SUIBase;->is_effect:Z

    goto :goto_1
.end method

.method protected paintAfter(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 0
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "cRect"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 303
    return-void
.end method

.method protected paintBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 245
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    if-nez v1, :cond_2

    .line 246
    iget v1, p0, Lcom/beyond/sui/SUIBase;->alpha:I

    if-lez v1, :cond_0

    .line 247
    iget v1, p0, Lcom/beyond/sui/SUIBase;->alpha:I

    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 264
    :cond_0
    :goto_0
    iget v1, p0, Lcom/beyond/sui/SUIBase;->color:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 265
    iget v1, p0, Lcom/beyond/sui/SUIBase;->color:I

    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 266
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v1, v3, v3, p3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 268
    :cond_1
    return-void

    .line 250
    :cond_2
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    if-lez v1, :cond_3

    .line 251
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 252
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    iget v2, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    .line 253
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    const/16 v2, 0xff

    if-lt v1, v2, :cond_0

    .line 254
    iput v4, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    goto :goto_0

    .line 256
    :cond_3
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    if-gez v1, :cond_0

    .line 257
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 258
    .local v0, "fade_v":I
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 259
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    iget v2, p0, Lcom/beyond/sui/SUIBase;->fade_value:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    .line 260
    iget v1, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    if-ltz v1, :cond_0

    .line 261
    iput v4, p0, Lcom/beyond/sui/SUIBase;->fade_current:I

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 0
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "cRect"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 300
    return-void
.end method

.method setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "cmpName"    # Ljava/lang/String;
    .param p2, "attr"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 420
    iget-object v2, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 422
    const-string v2, "visible"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 423
    const-string v2, "YES"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 424
    iput-boolean v0, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    .line 437
    :cond_0
    :goto_0
    return v0

    .line 426
    :cond_1
    iput-boolean v1, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    goto :goto_0

    .line 428
    :cond_2
    const-string v1, "alpha"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 431
    :try_start_0
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/beyond/sui/SUIBase;->alpha:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 432
    :catch_0
    move-exception v1

    goto :goto_0

    :cond_3
    move v0, v1

    .line 437
    goto :goto_0
.end method

.method protected setValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 358
    invoke-virtual {p0, p1, p2, p3}, Lcom/beyond/sui/SUIBase;->onSetValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected setValueStr(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "n"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 233
    if-nez p1, :cond_1

    .line 241
    :cond_0
    :goto_0
    return v0

    .line 235
    :cond_1
    iget-object v1, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 237
    iget-object v1, p0, Lcom/beyond/sui/SUIBase;->name:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 240
    iput-object p2, p0, Lcom/beyond/sui/SUIBase;->value:Ljava/lang/String;

    .line 241
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setVisible(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 399
    iput-boolean p1, p0, Lcom/beyond/sui/SUIBase;->isVisible:Z

    .line 400
    return-void
.end method
