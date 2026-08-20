.class Lcom/beyond/sui/SUIKeypadButton;
.super Lcom/beyond/sui/SUIButton;
.source "SUIKeypadButton.java"


# static fields
.field static final SWIP_CAP:I

.field private static hanChars:[C

.field private static hanCodes:[I

.field private static hanTypes:[I


# instance fields
.field image_pressed:Landroid/graphics/Bitmap;

.field private keyChars:[C

.field keyCode:I

.field keyType:I

.field private rect_img:Landroid/graphics/Rect;

.field swip_pad_name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/16 v1, 0x1f

    .line 32
    new-array v0, v1, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/beyond/sui/SUIKeypadButton;->hanChars:[C

    .line 39
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/beyond/sui/SUIKeypadButton;->hanCodes:[I

    .line 73
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/beyond/sui/SUIKeypadButton;->hanTypes:[I

    .line 21
    return-void

    .line 32
    :array_0
    .array-data 2
        0x3142s
        0x3148s
        0x3137s
        0x3131s
        0x3145s
        0x315bs
        0x3155s
        0x3151s
        0x3150s
        0x3154s
        0x3141s
        0x3134s
        0x3147s
        0x3139s
        0x314es
        0x3157s
        0x3153s
        0x314fs
        0x3163s
        0x314bs
        0x314cs
        0x314as
        0x314ds
        0x3160s
        0x315cs
        0x3161s
        0x2cs
        0x2es
        0x3fs
        0x20s
        0x2190s
    .end array-data

    .line 39
    nop

    :array_1
    .array-data 4
        0x1107
        0x110c
        0x1103
        0x1100
        0x1109
        0x116d
        0x1167
        0x1163
        0x1162
        0x1166
        0x1106
        0x1102
        0x110b
        0x1105
        0x1112
        0x1169
        0x1165
        0x1161
        0x1175
        0x110f
        0x1110
        0x110e
        0x1111
        0x1172
        0x116e
        0x1173
        0x2c
        0x2e
        0x3f
        0x20
        0x7f
    .end array-data

    .line 73
    :array_2
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x2
        0x2
        0x2
        0x2
        0x2
        0x1
        0x1
        0x1
        0x1
        0x1
        0x2
        0x2
        0x2
        0x2
        0x1
        0x1
        0x1
        0x1
        0x2
        0x2
        0x2
        0x80
        0x80
        0x80
        0x80
        0x80
    .end array-data
.end method

.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Lcom/beyond/sui/SUIButton;-><init>()V

    .line 24
    iput v2, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 25
    const/4 v0, 0x1

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyChars:[C

    .line 26
    iput v2, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    .line 27
    iput-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->swip_pad_name:Ljava/lang/String;

    .line 29
    iput-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->rect_img:Landroid/graphics/Rect;

    .line 30
    iput-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->image_pressed:Landroid/graphics/Bitmap;

    .line 21
    return-void
.end method

.method private getKorIndex(C)I
    .locals 2
    .param p1, "c"    # C

    .prologue
    .line 167
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lcom/beyond/sui/SUIKeypadButton;->hanChars:[C

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 171
    const/4 v0, -0x1

    .end local v0    # "i":I
    :cond_0
    return v0

    .line 168
    .restart local v0    # "i":I
    :cond_1
    sget-object v1, Lcom/beyond/sui/SUIKeypadButton;->hanChars:[C

    aget-char v1, v1, v0

    if-eq p1, v1, :cond_0

    .line 167
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private getRect(Ljava/lang/String;)Landroid/graphics/Rect;
    .locals 11
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 211
    if-nez p1, :cond_1

    .line 240
    :cond_0
    :goto_0
    return-object v3

    .line 213
    :cond_1
    new-instance v4, Lcom/beyond/util/SimpleTokenizer;

    const/16 v9, 0x2c

    invoke-direct {v4, p1, v9}, Lcom/beyond/util/SimpleTokenizer;-><init>(Ljava/lang/String;C)V

    .line 215
    .local v4, "st":Lcom/beyond/util/SimpleTokenizer;
    const/4 v1, 0x0

    .line 216
    .local v1, "ix":I
    const/4 v7, 0x0

    .line 217
    .local v7, "x":I
    const/4 v8, 0x0

    .line 218
    .local v8, "y":I
    const/4 v6, 0x0

    .line 219
    .local v6, "w":I
    const/4 v0, 0x0

    .line 221
    .local v0, "h":I
    :goto_1
    invoke-virtual {v4}, Lcom/beyond/util/SimpleTokenizer;->next()Ljava/lang/String;

    move-result-object v5

    .line 222
    .local v5, "strTmp":Ljava/lang/String;
    if-eqz v5, :cond_0

    .line 224
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ix":I
    .local v2, "ix":I
    packed-switch v1, :pswitch_data_0

    move v1, v2

    .line 220
    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    goto :goto_1

    .line 226
    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    :pswitch_0
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    move v1, v2

    .line 227
    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    goto :goto_1

    .line 229
    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    :pswitch_1
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    move v1, v2

    .line 230
    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    goto :goto_1

    .line 232
    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    :pswitch_2
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    move v1, v2

    .line 233
    .end local v2    # "ix":I
    .restart local v1    # "ix":I
    goto :goto_1

    .line 235
    .end local v1    # "ix":I
    .restart local v2    # "ix":I
    :pswitch_3
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 236
    new-instance v3, Landroid/graphics/Rect;

    add-int v9, v7, v6

    add-int v10, v8, v0

    invoke-direct {v3, v7, v8, v9, v10}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 237
    .local v3, "r":Landroid/graphics/Rect;
    goto :goto_0

    .line 224
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private setKoreanKey(Ljava/lang/String;)Z
    .locals 4
    .param p1, "key_char"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 157
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 158
    .local v0, "c":C
    invoke-direct {p0, v0}, Lcom/beyond/sui/SUIKeypadButton;->getKorIndex(C)I

    move-result v1

    .line 159
    .local v1, "index":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 163
    :goto_0
    return v2

    .line 161
    :cond_0
    sget-object v2, Lcom/beyond/sui/SUIKeypadButton;->hanTypes:[I

    aget v2, v2, v1

    iput v2, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 162
    sget-object v2, Lcom/beyond/sui/SUIKeypadButton;->hanCodes:[I

    aget v2, v2, v1

    iput v2, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    .line 163
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method contains(II)Z
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 204
    const/4 v0, 0x0

    .line 205
    .local v0, "in":Z
    iget-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->rect:Landroid/graphics/Rect;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v0

    .line 206
    return v0
.end method

.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 7
    .param p1, "xml"    # Lnanoxml/XMLElement;

    .prologue
    const/4 v6, 0x0

    .line 120
    invoke-virtual {p1}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v3

    .line 122
    .local v3, "v":Ljava/util/Vector;
    const-string v4, "rect"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/beyond/sui/SUIKeypadButton;->getRect(Ljava/lang/String;)Landroid/graphics/Rect;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIKeypadButton;->rect_img:Landroid/graphics/Rect;

    .line 123
    iget-object v4, p0, Lcom/beyond/sui/SUIKeypadButton;->rect_img:Landroid/graphics/Rect;

    invoke-virtual {p0, v4}, Lcom/beyond/sui/SUIKeypadButton;->getScaledRect(Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v4

    iget-object v5, p0, Lcom/beyond/sui/SUIKeypadButton;->parent:Lcom/beyond/sui/SUIBase;

    iget-object v5, v5, Lcom/beyond/sui/SUIBase;->rect:Landroid/graphics/Rect;

    invoke-virtual {p0, v4, v5}, Lcom/beyond/sui/SUIKeypadButton;->getAbsoluteRect(Landroid/graphics/Rect;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIKeypadButton;->rect:Landroid/graphics/Rect;

    .line 125
    const-string v4, "swip_pad_name"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/beyond/sui/SUIKeypadButton;->swip_pad_name:Ljava/lang/String;

    .line 126
    const-string v4, "key_code"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 127
    .local v2, "sKeyCode":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 128
    invoke-static {v2}, Lcom/beyond/screen/KeyCode;->getCode4String(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/beyond/sui/SUIKeypadButton;->key_code:I

    .line 130
    :cond_0
    const-string v4, "key_char"

    invoke-virtual {p1, v4}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 131
    .local v1, "key_char":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 132
    invoke-virtual {v1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 133
    .local v0, "c":C
    iget-object v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyChars:[C

    aput-char v0, v4, v6

    .line 134
    const/16 v4, 0x61

    if-lt v0, v4, :cond_2

    const/16 v4, 0x7a

    if-gt v0, v4, :cond_2

    .line 135
    const/16 v4, 0x20

    iput v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 136
    iput v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    .line 153
    .end local v0    # "c":C
    :cond_1
    :goto_0
    const/4 v4, 0x1

    return v4

    .line 138
    .restart local v0    # "c":C
    :cond_2
    const/16 v4, 0x41

    if-lt v0, v4, :cond_3

    const/16 v4, 0x5a

    if-gt v0, v4, :cond_3

    .line 139
    const/16 v4, 0x10

    iput v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 140
    iput v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    goto :goto_0

    .line 142
    :cond_3
    const/16 v4, 0x30

    if-lt v0, v4, :cond_4

    const/16 v4, 0x39

    if-gt v0, v4, :cond_4

    .line 143
    const/16 v4, 0x40

    iput v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 144
    iput v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    goto :goto_0

    .line 146
    :cond_4
    if-eqz v1, :cond_1

    .line 147
    invoke-direct {p0, v1}, Lcom/beyond/sui/SUIKeypadButton;->setKoreanKey(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 148
    const/16 v4, 0x80

    iput v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    .line 149
    iput v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    goto :goto_0
.end method

.method protected mouseEvnet(ILandroid/view/MotionEvent;Landroid/graphics/Rect;Landroid/view/View;)I
    .locals 7
    .param p1, "event"    # I
    .param p2, "arg0"    # Landroid/view/MotionEvent;
    .param p3, "rc"    # Landroid/graphics/Rect;
    .param p4, "jc"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x1

    .line 175
    iget v1, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    .line 176
    .local v1, "old_state":I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {p0, v3, v4}, Lcom/beyond/sui/SUIKeypadButton;->contains(II)Z

    move-result v0

    .line 178
    .local v0, "in":Z
    if-ne p1, v2, :cond_2

    .line 179
    if-eqz v0, :cond_0

    .line 181
    iput v2, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    .line 200
    :goto_0
    return v2

    .line 185
    :cond_0
    iput v6, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    .line 200
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 188
    :cond_2
    if-ne p1, v6, :cond_1

    .line 189
    if-eqz v0, :cond_1

    .line 190
    iget v3, p0, Lcom/beyond/sui/SUIKeypadButton;->key_code:I

    const/4 v4, -0x5

    if-ne v3, v4, :cond_3

    .line 191
    iput v6, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    goto :goto_0

    .line 194
    :cond_3
    iget v3, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    const/4 v4, -0x1

    if-eq v3, v4, :cond_4

    .line 195
    invoke-static {}, Lcom/beyond/sui/AutomataX;->getInst()Lcom/beyond/sui/AutomataX;

    move-result-object v3

    iget v4, p0, Lcom/beyond/sui/SUIKeypadButton;->keyType:I

    iget v5, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    invoke-virtual {v3, v4, v5}, Lcom/beyond/sui/AutomataX;->processAutomata(II)Z

    .line 196
    :cond_4
    iput v6, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    goto :goto_0
.end method

.method protected paintContent(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .locals 7
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "rc"    # Landroid/graphics/Rect;
    .param p3, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 109
    iget v0, p0, Lcom/beyond/sui/SUIKeypadButton;->state_press:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 110
    iget-object v0, p0, Lcom/beyond/sui/SUIKeypadButton;->image_pressed:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/beyond/sui/SUIKeypadButton;->image_pressed:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->rect_img:Landroid/graphics/Rect;

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 112
    iget v0, p0, Lcom/beyond/sui/SUIKeypadButton;->keyCode:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 113
    iget-object v0, p0, Lcom/beyond/sui/SUIKeypadButton;->image_pressed:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/beyond/sui/SUIKeypadButton;->rect_img:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Rect;

    iget v3, p2, Landroid/graphics/Rect;->left:I

    add-int/lit8 v3, v3, -0x3

    iget v4, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v5

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x3

    iget v5, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x3

    iget v6, p2, Landroid/graphics/Rect;->top:I

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v0, v1, v2, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 117
    :cond_0
    return-void
.end method
