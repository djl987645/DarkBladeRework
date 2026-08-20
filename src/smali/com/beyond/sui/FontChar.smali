.class Lcom/beyond/sui/FontChar;
.super Ljava/lang/Object;
.source "FontChar.java"


# static fields
.field static final H_CHOSUNG:I = 0x0

.field static final H_JONGSUNG:I = 0x2

.field static final H_JUNGSUNG:I = 0x1

.field static final H_NONE:I = -0x1

.field static final MP_BOTTOM:I = 0x1

.field static final MP_RB:I = 0x2

.field static final MP_RIGHT:I


# instance fields
.field code:C

.field height:I

.field kIxFirstC:I

.field kIxFirstL:I

.field kIxLast:I

.field kIxMidle:I

.field kMidlePos:I

.field width:I

.field x:I

.field y:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, -0x1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxFirstL:I

    .line 30
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxFirstC:I

    .line 31
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 32
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    .line 33
    iput v0, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    .line 14
    return-void
.end method

.method private setKorIxChosung(Z)V
    .locals 2
    .param p1, "isLeft"    # Z

    .prologue
    .line 167
    const/4 v0, -0x1

    .line 168
    .local v0, "kIxFirst":I
    iget-char v1, p0, Lcom/beyond/sui/FontChar;->code:C

    packed-switch v1, :pswitch_data_0

    .line 228
    :goto_0
    :pswitch_0
    if-eqz p1, :cond_0

    .line 229
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxFirstL:I

    .line 232
    :goto_1
    return-void

    .line 170
    :pswitch_1
    const/4 v0, 0x0

    .line 171
    goto :goto_0

    .line 173
    :pswitch_2
    const/4 v0, 0x1

    .line 174
    goto :goto_0

    .line 176
    :pswitch_3
    const/4 v0, 0x2

    .line 177
    goto :goto_0

    .line 179
    :pswitch_4
    const/4 v0, 0x3

    .line 180
    goto :goto_0

    .line 182
    :pswitch_5
    const/4 v0, 0x4

    .line 183
    goto :goto_0

    .line 185
    :pswitch_6
    const/4 v0, 0x5

    .line 186
    goto :goto_0

    .line 188
    :pswitch_7
    const/4 v0, 0x6

    .line 189
    goto :goto_0

    .line 191
    :pswitch_8
    const/4 v0, 0x7

    .line 192
    goto :goto_0

    .line 194
    :pswitch_9
    const/16 v0, 0x8

    .line 195
    goto :goto_0

    .line 197
    :pswitch_a
    const/16 v0, 0x9

    .line 198
    goto :goto_0

    .line 200
    :pswitch_b
    const/16 v0, 0xa

    .line 201
    goto :goto_0

    .line 203
    :pswitch_c
    const/16 v0, 0xb

    .line 204
    goto :goto_0

    .line 206
    :pswitch_d
    const/16 v0, 0xc

    .line 207
    goto :goto_0

    .line 209
    :pswitch_e
    const/16 v0, 0xd

    .line 210
    goto :goto_0

    .line 212
    :pswitch_f
    const/16 v0, 0xe

    .line 213
    goto :goto_0

    .line 215
    :pswitch_10
    const/16 v0, 0xf

    .line 216
    goto :goto_0

    .line 218
    :pswitch_11
    const/16 v0, 0x10

    .line 219
    goto :goto_0

    .line 221
    :pswitch_12
    const/16 v0, 0x11

    .line 222
    goto :goto_0

    .line 224
    :pswitch_13
    const/16 v0, 0x12

    goto :goto_0

    .line 231
    :cond_0
    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxFirstC:I

    goto :goto_1

    .line 168
    nop

    :pswitch_data_0
    .packed-switch 0x3131
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_0
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
    .end packed-switch
.end method

.method private setKorIxJongsung()V
    .locals 1

    .prologue
    .line 73
    iget-char v0, p0, Lcom/beyond/sui/FontChar;->code:C

    packed-switch v0, :pswitch_data_0

    .line 164
    :goto_0
    :pswitch_0
    return-void

    .line 76
    :pswitch_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 79
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 82
    :pswitch_3
    const/4 v0, 0x4

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 85
    :pswitch_4
    const/4 v0, 0x7

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 90
    :pswitch_5
    const/16 v0, 0x8

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 93
    :pswitch_6
    const/16 v0, 0x10

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 96
    :pswitch_7
    const/16 v0, 0x11

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 101
    :pswitch_8
    const/16 v0, 0x13

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 104
    :pswitch_9
    const/16 v0, 0x14

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 107
    :pswitch_a
    const/16 v0, 0x15

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 110
    :pswitch_b
    const/16 v0, 0x16

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 115
    :pswitch_c
    const/16 v0, 0x17

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 118
    :pswitch_d
    const/16 v0, 0x18

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 121
    :pswitch_e
    const/16 v0, 0x19

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 124
    :pswitch_f
    const/16 v0, 0x1a

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 127
    :pswitch_10
    const/16 v0, 0x1b

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 130
    :pswitch_11
    const/4 v0, 0x3

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 133
    :pswitch_12
    const/4 v0, 0x5

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 136
    :pswitch_13
    const/4 v0, 0x6

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 139
    :pswitch_14
    const/16 v0, 0x9

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 142
    :pswitch_15
    const/16 v0, 0xa

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 145
    :pswitch_16
    const/16 v0, 0xb

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 148
    :pswitch_17
    const/16 v0, 0xc

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 151
    :pswitch_18
    const/16 v0, 0xd

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 154
    :pswitch_19
    const/16 v0, 0xe

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 157
    :pswitch_1a
    const/16 v0, 0xf

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 160
    :pswitch_1b
    const/16 v0, 0x12

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxLast:I

    goto :goto_0

    .line 73
    :pswitch_data_0
    .packed-switch 0x3131
        :pswitch_1
        :pswitch_2
        :pswitch_11
        :pswitch_3
        :pswitch_12
        :pswitch_13
        :pswitch_4
        :pswitch_0
        :pswitch_5
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_17
        :pswitch_18
        :pswitch_19
        :pswitch_1a
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_1b
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_0
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method

.method private setKorIxJungsung()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x2

    const/4 v1, 0x0

    .line 235
    iget-char v0, p0, Lcom/beyond/sui/FontChar;->code:C

    packed-switch v0, :pswitch_data_0

    .line 321
    :goto_0
    return-void

    .line 237
    :pswitch_0
    iput v1, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 238
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 241
    :pswitch_1
    iput v3, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 242
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 245
    :pswitch_2
    iput v2, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 246
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 249
    :pswitch_3
    const/4 v0, 0x3

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 250
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 253
    :pswitch_4
    const/4 v0, 0x4

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 254
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 257
    :pswitch_5
    const/4 v0, 0x5

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 258
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 261
    :pswitch_6
    const/4 v0, 0x6

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 262
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 265
    :pswitch_7
    const/4 v0, 0x7

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 266
    iput v1, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 269
    :pswitch_8
    const/16 v0, 0x8

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 270
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 273
    :pswitch_9
    const/16 v0, 0x9

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 274
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 277
    :pswitch_a
    const/16 v0, 0xa

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 278
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 281
    :pswitch_b
    const/16 v0, 0xb

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 282
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 285
    :pswitch_c
    const/16 v0, 0xc

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 286
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 289
    :pswitch_d
    const/16 v0, 0xd

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 290
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 293
    :pswitch_e
    const/16 v0, 0xe

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 294
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 297
    :pswitch_f
    const/16 v0, 0xf

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 298
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 301
    :pswitch_10
    const/16 v0, 0x10

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 302
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 305
    :pswitch_11
    const/16 v0, 0x11

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 306
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 309
    :pswitch_12
    const/16 v0, 0x12

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 310
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto :goto_0

    .line 313
    :pswitch_13
    const/16 v0, 0x14

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 314
    iput v3, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto/16 :goto_0

    .line 317
    :pswitch_14
    const/16 v0, 0x13

    iput v0, p0, Lcom/beyond/sui/FontChar;->kIxMidle:I

    .line 318
    iput v2, p0, Lcom/beyond/sui/FontChar;->kMidlePos:I

    goto/16 :goto_0

    .line 235
    nop

    :pswitch_data_0
    .packed-switch 0x314f
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_14
        :pswitch_13
    .end packed-switch
.end method


# virtual methods
.method drawChar(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIILandroid/graphics/Paint;)I
    .locals 8
    .param p1, "g"    # Landroid/graphics/Canvas;
    .param p2, "image_font"    # Landroid/graphics/Bitmap;
    .param p3, "dx"    # I
    .param p4, "dy"    # I
    .param p5, "fontSize"    # I
    .param p6, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 36
    iget v2, p0, Lcom/beyond/sui/FontChar;->width:I

    mul-int/2addr v2, p5

    iget v3, p0, Lcom/beyond/sui/FontChar;->height:I

    div-int v1, v2, v3

    .line 37
    .local v1, "w":I
    new-instance v0, Landroid/graphics/Rect;

    add-int v2, p3, v1

    add-int v3, p4, p5

    invoke-direct {v0, p3, p4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 40
    .local v0, "rct":Landroid/graphics/Rect;
    new-instance v2, Landroid/graphics/Rect;

    iget v3, p0, Lcom/beyond/sui/FontChar;->x:I

    iget v4, p0, Lcom/beyond/sui/FontChar;->y:I

    iget v5, p0, Lcom/beyond/sui/FontChar;->x:I

    iget v6, p0, Lcom/beyond/sui/FontChar;->width:I

    add-int/2addr v5, v6

    iget v6, p0, Lcom/beyond/sui/FontChar;->y:I

    iget v7, p0, Lcom/beyond/sui/FontChar;->height:I

    add-int/2addr v6, v7

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 39
    invoke-virtual {p1, p2, v2, v0, p6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 41
    return v1
.end method

.method setKorIndex(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v0, "jungsung"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 58
    invoke-direct {p0}, Lcom/beyond/sui/FontChar;->setKorIxJungsung()V

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    const-string v0, "chosung_left"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 62
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/beyond/sui/FontChar;->setKorIxChosung(Z)V

    goto :goto_0

    .line 64
    :cond_2
    const-string v0, "chosung_center"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/beyond/sui/FontChar;->setKorIxChosung(Z)V

    goto :goto_0

    .line 67
    :cond_3
    const-string v0, "jongsung"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0}, Lcom/beyond/sui/FontChar;->setKorIxJongsung()V

    goto :goto_0
.end method
