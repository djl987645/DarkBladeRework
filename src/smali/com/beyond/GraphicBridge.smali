.class public Lcom/beyond/GraphicBridge;
.super Ljava/lang/Object;
.source "GraphicBridge.java"


# static fields
.field public static final BASELINE:I = 0x40

.field public static final BOTTOM:I = 0x20

.field public static final DOTTED:I = 0x1

.field public static final HCENTER:I = 0x1

.field public static final LEFT:I = 0x4

.field public static final RIGHT:I = 0x8

.field public static final TOP:I = 0x0

.field public static final VCENTER:I = 0x2


# instance fields
.field protected alpha:I

.field protected clipX1:I

.field protected clipX2:I

.field protected clipY1:I

.field protected clipY2:I

.field public frameBuffer:I

.field private g_canvas:Landroid/graphics/Canvas;

.field protected gray:I

.field protected h:I

.field protected mode:I

.field protected obj_ft:Ljava/lang/Object;

.field protected obj_img:Ljava/lang/Object;

.field private paint:Landroid/graphics/Paint;

.field protected rgb:I

.field protected style:I

.field protected transX:I

.field protected transY:I

.field protected w:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    .line 29
    iput-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    .line 42
    const/16 v0, 0xff

    iput v0, p0, Lcom/beyond/GraphicBridge;->alpha:I

    .line 13
    return-void
.end method

.method private clipImageRect([I[I[I)Z
    .locals 7
    .param p1, "clip"    # [I
    .param p2, "src"    # [I
    .param p3, "des"    # [I

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 351
    aget v2, p3, v1

    aget v3, p3, v5

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    aget v3, p1, v1

    if-lt v2, v3, :cond_0

    aget v2, p3, v1

    aget v3, p1, v5

    if-lt v2, v3, :cond_1

    .line 352
    :cond_0
    aput v1, p3, v6

    aput v1, p3, v5

    move v0, v1

    .line 386
    :goto_0
    return v0

    .line 356
    :cond_1
    aget v2, p3, v0

    aget v3, p3, v6

    add-int/2addr v2, v3

    add-int/lit8 v2, v2, -0x1

    aget v3, p1, v0

    if-lt v2, v3, :cond_2

    aget v2, p3, v0

    aget v3, p1, v6

    if-lt v2, v3, :cond_3

    .line 357
    :cond_2
    aput v1, p3, v6

    aput v1, p3, v5

    move v0, v1

    .line 358
    goto :goto_0

    .line 361
    :cond_3
    aget v2, p3, v1

    aget v3, p1, v1

    if-ge v2, v3, :cond_4

    .line 362
    aget v2, p3, v5

    aget v3, p1, v1

    aget v4, p3, v1

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    aput v2, p3, v5

    .line 363
    aget v2, p2, v1

    aget v3, p1, v1

    aget v4, p3, v1

    sub-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, p2, v1

    .line 364
    aget v2, p1, v1

    aput v2, p3, v1

    .line 367
    :cond_4
    aget v2, p3, v0

    aget v3, p1, v0

    if-ge v2, v3, :cond_5

    .line 369
    aget v2, p3, v6

    aget v3, p1, v0

    aget v4, p3, v0

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    aput v2, p3, v6

    .line 370
    aget v2, p2, v0

    aget v3, p1, v0

    aget v4, p3, v0

    sub-int/2addr v3, v4

    add-int/2addr v2, v3

    aput v2, p2, v0

    .line 371
    aget v2, p1, v0

    aput v2, p3, v0

    .line 374
    :cond_5
    aget v2, p3, v1

    aget v3, p3, v5

    add-int/2addr v2, v3

    aget v3, p1, v5

    if-le v2, v3, :cond_6

    .line 375
    aget v2, p1, v5

    aget v3, p3, v1

    sub-int/2addr v2, v3

    aput v2, p3, v5

    .line 377
    :cond_6
    aget v2, p3, v0

    aget v3, p3, v6

    add-int/2addr v2, v3

    aget v3, p1, v6

    if-le v2, v3, :cond_7

    .line 378
    aget v2, p1, v6

    aget v3, p3, v0

    sub-int/2addr v2, v3

    aput v2, p3, v6

    .line 380
    :cond_7
    aget v2, p3, v5

    if-lez v2, :cond_8

    aget v2, p3, v6

    if-gtz v2, :cond_9

    :cond_8
    move v0, v1

    .line 381
    goto :goto_0

    .line 383
    :cond_9
    aget v1, p3, v5

    aput v1, p2, v5

    .line 384
    aget v1, p3, v6

    aput v1, p2, v6

    goto/16 :goto_0
.end method

.method private fbGetBytesPerLine(II)I
    .locals 2
    .param p1, "w"    # I
    .param p2, "plane"    # I

    .prologue
    .line 69
    invoke-static {}, Lcom/beyond/LcduiBridge;->getBitsPerPixelAn()I

    move-result v0

    .line 70
    .local v0, "bpp":I
    if-eqz p2, :cond_0

    add-int/lit8 v1, p1, 0x7

    shr-int/lit8 v1, v1, 0x3

    :goto_0
    return v1

    :cond_0
    mul-int v1, v0, p1

    add-int/lit8 v1, v1, 0x7

    shr-int/lit8 v1, v1, 0x3

    goto :goto_0
.end method

.method private getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .locals 5
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 83
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, p1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 84
    .local v1, "lp":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/beyond/GraphicBridge;->getStrokeStyle()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 85
    const/4 v3, 0x2

    new-array v0, v3, [F

    fill-array-data v0, :array_0

    .line 86
    .local v0, "intervals":[F
    new-instance v2, Landroid/graphics/DashPathEffect;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {v2, v0, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    .line 87
    .local v2, "pe":Landroid/graphics/DashPathEffect;
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 89
    .end local v0    # "intervals":[F
    .end local v2    # "pe":Landroid/graphics/DashPathEffect;
    :cond_0
    return-object v1

    .line 85
    nop

    :array_0
    .array-data 4
        0x40000000    # 2.0f
        0x40000000    # 2.0f
    .end array-data
.end method

.method private getXfermodePaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .locals 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 93
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, p1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 94
    .local v0, "lp":Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/beyond/GraphicBridge;->isXORMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 95
    new-instance v1, Landroid/graphics/PixelXorXfermode;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroid/graphics/PixelXorXfermode;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 97
    :cond_0
    return-object v0
.end method

.method protected static noti()V
    .locals 2

    .prologue
    .line 52
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "GraphicBridge.noti"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 53
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "not Implemented !!!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setTextAnchor(I)V
    .locals 3
    .param p1, "anchor"    # I

    .prologue
    .line 317
    and-int/lit8 v0, p1, 0xd

    packed-switch v0, :pswitch_data_0

    .line 329
    :pswitch_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid anchor : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 319
    :pswitch_1
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 332
    :goto_0
    and-int/lit8 v0, p1, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 333
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid anchor : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :pswitch_2
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 326
    :pswitch_3
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 335
    :cond_0
    and-int/lit8 v0, p1, 0x60

    sparse-switch v0, :sswitch_data_0

    .line 344
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "invalid anchor : "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :sswitch_0
    return-void

    .line 317
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 335
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x20 -> :sswitch_0
        0x40 -> :sswitch_0
    .end sparse-switch
.end method


# virtual methods
.method protected arc(IIIIIIZ)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "startAngle"    # I
    .param p6, "arcAngle"    # I
    .param p7, "filled"    # Z

    .prologue
    .line 142
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p1, v0

    .line 143
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p2, v0

    .line 145
    new-instance v5, Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {v5, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 147
    .local v5, "ap":Landroid/graphics/Paint;
    if-eqz p7, :cond_0

    .line 148
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 149
    invoke-direct {p0, v5}, Lcom/beyond/GraphicBridge;->getXfermodePaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v5

    .line 154
    :goto_0
    invoke-direct {p0, v5}, Lcom/beyond/GraphicBridge;->getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v5

    .line 156
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v1, Landroid/graphics/RectF;

    int-to-float v2, p1

    int-to-float v3, p2

    add-int v4, p1, p3

    int-to-float v4, v4

    add-int v6, p2, p4

    int-to-float v6, v6

    invoke-direct {v1, v2, v3, v4, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    int-to-float v2, p5

    neg-int v3, p6

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 157
    return-void

    .line 152
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_0
.end method

.method protected copyArea0(Lcom/beyond/ImageBridge;IIIIII)V
    .locals 5
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "dx"    # I
    .param p3, "dy"    # I
    .param p4, "sx"    # I
    .param p5, "sy"    # I
    .param p6, "w"    # I
    .param p7, "h"    # I

    .prologue
    .line 290
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p4, v1

    .line 291
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p5, v1

    .line 293
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v1

    .line 294
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v1

    .line 296
    iget-object v1, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-static {v1, p4, p5, p6, p7}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 297
    .local v0, "src":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    int-to-float v2, p2

    int-to-float v3, p3

    iget-object v4, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 298
    return-void
.end method

.method protected drawChars0([CIIIII)V
    .locals 9
    .param p1, "data"    # [C
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "anchor"    # I

    .prologue
    const/4 v8, 0x0

    .line 391
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p4, v0

    .line 392
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p5, v0

    .line 394
    invoke-direct {p0, p6}, Lcom/beyond/GraphicBridge;->setTextAnchor(I)V

    .line 395
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v7

    .line 396
    .local v7, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    iget v1, p0, Lcom/beyond/GraphicBridge;->clipX1:I

    iget v2, p0, Lcom/beyond/GraphicBridge;->clipY1:I

    iget v3, p0, Lcom/beyond/GraphicBridge;->clipX2:I

    iget v4, p0, Lcom/beyond/GraphicBridge;->clipY2:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 397
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    int-to-float v4, p4

    iget v1, v7, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int v1, p5, v1

    add-int/lit8 v1, v1, 0x1

    int-to-float v5, v1

    iget-object v6, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText([CIIFFLandroid/graphics/Paint;)V

    .line 398
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v1, Landroid/graphics/Rect;

    iget v2, p0, Lcom/beyond/GraphicBridge;->w:I

    iget v3, p0, Lcom/beyond/GraphicBridge;->h:I

    invoke-direct {v1, v8, v8, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    sget-object v2, Landroid/graphics/Region$Op;->UNION:Landroid/graphics/Region$Op;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 399
    return-void
.end method

.method protected drawImage0(Lcom/beyond/ImageBridge;III)V
    .locals 14
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "anchor"    # I

    .prologue
    .line 403
    if-nez p1, :cond_0

    .line 404
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "Image is null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 407
    :cond_0
    iget v5, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int p2, p2, v5

    .line 408
    iget v5, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int p3, p3, v5

    .line 412
    and-int/lit8 v5, p4, 0x40

    const/16 v6, 0x40

    if-ne v5, v6, :cond_1

    .line 413
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "invalid anchor : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 415
    :cond_1
    and-int/lit8 v5, p4, 0xd

    packed-switch v5, :pswitch_data_0

    .line 427
    :pswitch_0
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "invalid anchor : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 417
    :pswitch_1
    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getWidth()I

    move-result v5

    sub-int p2, p2, v5

    .line 430
    :goto_0
    :pswitch_2
    and-int/lit8 v5, p4, 0x22

    sparse-switch v5, :sswitch_data_0

    .line 440
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "invalid anchor : "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move/from16 v0, p4

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 421
    :pswitch_3
    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getWidth()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    sub-int p2, p2, v5

    .line 422
    goto :goto_0

    .line 432
    :sswitch_0
    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getHeight()I

    move-result v5

    sub-int p3, p3, v5

    .line 443
    :goto_1
    :sswitch_1
    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getWidth()I

    move-result v5

    if-lez v5, :cond_2

    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getHeight()I

    move-result v5

    if-gtz v5, :cond_3

    .line 472
    :cond_2
    :goto_2
    return-void

    .line 435
    :sswitch_2
    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getHeight()I

    move-result v5

    shr-int/lit8 v5, v5, 0x1

    sub-int p3, p3, v5

    .line 436
    goto :goto_1

    .line 447
    :cond_3
    iget-object v5, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    if-eqz v5, :cond_2

    .line 450
    const/4 v5, 0x4

    new-array v1, v5, [I

    const/4 v5, 0x0

    iget v6, p0, Lcom/beyond/GraphicBridge;->clipX1:I

    aput v6, v1, v5

    const/4 v5, 0x1

    iget v6, p0, Lcom/beyond/GraphicBridge;->clipY1:I

    aput v6, v1, v5

    const/4 v5, 0x2

    iget v6, p0, Lcom/beyond/GraphicBridge;->clipX2:I

    aput v6, v1, v5

    const/4 v5, 0x3

    iget v6, p0, Lcom/beyond/GraphicBridge;->clipY2:I

    aput v6, v1, v5

    .line 451
    .local v1, "clip":[I
    const/4 v5, 0x4

    new-array v4, v5, [I

    const/4 v5, 0x2

    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getWidth()I

    move-result v6

    aput v6, v4, v5

    const/4 v5, 0x3

    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getHeight()I

    move-result v6

    aput v6, v4, v5

    .line 452
    .local v4, "src":[I
    const/4 v5, 0x4

    new-array v2, v5, [I

    const/4 v5, 0x0

    aput p2, v2, v5

    const/4 v5, 0x1

    aput p3, v2, v5

    const/4 v5, 0x2

    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getWidth()I

    move-result v6

    aput v6, v2, v5

    const/4 v5, 0x3

    invoke-virtual {p1}, Lcom/beyond/ImageBridge;->getHeight()I

    move-result v6

    aput v6, v2, v5

    .line 454
    .local v2, "des":[I
    invoke-direct {p0, v1, v4, v2}, Lcom/beyond/GraphicBridge;->clipImageRect([I[I[I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 457
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 458
    .local v3, "paint_img":Landroid/graphics/Paint;
    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 459
    iget v5, p0, Lcom/beyond/GraphicBridge;->alpha:I

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 460
    iget-object v5, p1, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    if-eqz v5, :cond_4

    .line 461
    iget-object v5, p1, Lcom/beyond/ImageBridge;->movie:Landroid/graphics/Movie;

    iget-object v6, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    const/4 v7, 0x0

    aget v7, v2, v7

    int-to-float v7, v7

    const/4 v8, 0x1

    aget v8, v2, v8

    int-to-float v8, v8

    invoke-virtual {v5, v6, v7, v8, v3}, Landroid/graphics/Movie;->draw(Landroid/graphics/Canvas;FFLandroid/graphics/Paint;)V

    goto :goto_2

    .line 464
    :cond_4
    iget-object v5, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    iget-object v6, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    new-instance v7, Landroid/graphics/Rect;

    const/4 v8, 0x0

    aget v8, v4, v8

    const/4 v9, 0x1

    aget v9, v4, v9

    const/4 v10, 0x0

    aget v10, v4, v10

    const/4 v11, 0x2

    aget v11, v4, v11

    add-int/2addr v10, v11

    const/4 v11, 0x1

    aget v11, v4, v11

    const/4 v12, 0x3

    aget v12, v4, v12

    add-int/2addr v11, v12

    invoke-direct {v7, v8, v9, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 465
    new-instance v8, Landroid/graphics/Rect;

    const/4 v9, 0x0

    aget v9, v2, v9

    const/4 v10, 0x1

    aget v10, v2, v10

    const/4 v11, 0x0

    aget v11, v2, v11

    const/4 v12, 0x2

    aget v12, v2, v12

    add-int/2addr v11, v12

    const/4 v12, 0x1

    aget v12, v2, v12

    const/4 v13, 0x3

    aget v13, v2, v13

    add-int/2addr v12, v13

    invoke-direct {v8, v9, v10, v11, v12}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 464
    invoke-virtual {v5, v6, v7, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_2

    .line 415
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 430
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x2 -> :sswitch_2
        0x20 -> :sswitch_0
    .end sparse-switch
.end method

.method protected drawLine0(IIII)V
    .locals 6
    .param p1, "x1"    # I
    .param p2, "y1"    # I
    .param p3, "x2"    # I
    .param p4, "y2"    # I

    .prologue
    .line 102
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    if-nez v0, :cond_0

    .line 113
    :goto_0
    return-void

    .line 105
    :cond_0
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p1, v0

    .line 106
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p2, v0

    .line 107
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p3, v0

    .line 108
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p4, v0

    .line 110
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v0}, Lcom/beyond/GraphicBridge;->getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v5

    .line 112
    .local v5, "lp":Landroid/graphics/Paint;
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    int-to-float v1, p1

    int-to-float v2, p2

    int-to-float v3, p3

    int-to-float v4, p4

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected drawPolygon0([I[I)V
    .locals 6
    .param p1, "x"    # [I
    .param p2, "y"    # [I

    .prologue
    const/4 v5, 0x0

    .line 182
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 183
    :cond_0
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "drawPolygon"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 185
    :cond_1
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_2

    .line 186
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "drawPolygon"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 188
    :cond_2
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 190
    .local v2, "path":Landroid/graphics/Path;
    aget v3, p1, v5

    int-to-float v3, v3

    aget v4, p2, v5

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 192
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-lt v0, v3, :cond_3

    .line 195
    aget v3, p1, v5

    int-to-float v3, v3

    aget v4, p2, v5

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 197
    iget-object v3, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v3}, Lcom/beyond/GraphicBridge;->getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v1

    .line 198
    .local v1, "lp":Landroid/graphics/Paint;
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 199
    iget-object v3, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v2, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 200
    return-void

    .line 193
    .end local v1    # "lp":Landroid/graphics/Paint;
    :cond_3
    aget v3, p1, v0

    int-to-float v3, v3

    aget v4, p2, v0

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 192
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected drawRect0(IIII)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 119
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p1, v1

    .line 120
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p2, v1

    .line 122
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v1}, Lcom/beyond/GraphicBridge;->getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v0

    .line 123
    .local v0, "lp":Landroid/graphics/Paint;
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v2, Landroid/graphics/RectF;

    int-to-float v3, p1

    int-to-float v4, p2

    add-int v5, p1, p3

    int-to-float v5, v5

    add-int v6, p2, p4

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 125
    return-void
.end method

.method protected drawRoundRect0(IIIIII)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "arcWidth"    # I
    .param p6, "arcHeight"    # I

    .prologue
    .line 128
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    if-nez v1, :cond_0

    .line 137
    :goto_0
    return-void

    .line 131
    :cond_0
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p1, v1

    .line 132
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p2, v1

    .line 134
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v1}, Lcom/beyond/GraphicBridge;->getDottedPaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v0

    .line 135
    .local v0, "lp":Landroid/graphics/Paint;
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 136
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v2, Landroid/graphics/RectF;

    int-to-float v3, p1

    int-to-float v4, p2

    add-int v5, p1, p3

    int-to-float v5, v5

    add-int v6, p2, p4

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    int-to-float v3, p5

    int-to-float v4, p6

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public drawString(Ljava/lang/String;III)V
    .locals 7
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "anchor"    # I

    .prologue
    const/4 v6, 0x0

    .line 476
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    if-nez v1, :cond_0

    .line 488
    :goto_0
    return-void

    .line 478
    :cond_0
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v1

    .line 479
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v1

    .line 481
    invoke-direct {p0, p4}, Lcom/beyond/GraphicBridge;->setTextAnchor(I)V

    .line 482
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    .line 485
    .local v0, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    iget v2, p0, Lcom/beyond/GraphicBridge;->clipX1:I

    iget v3, p0, Lcom/beyond/GraphicBridge;->clipY1:I

    iget v4, p0, Lcom/beyond/GraphicBridge;->clipX2:I

    iget v5, p0, Lcom/beyond/GraphicBridge;->clipY2:I

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 486
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    int-to-float v2, p2

    iget v3, v0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int v3, p3, v3

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    iget-object v4, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, p1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 487
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v2, Landroid/graphics/Rect;

    iget v3, p0, Lcom/beyond/GraphicBridge;->w:I

    iget v4, p0, Lcom/beyond/GraphicBridge;->h:I

    invoke-direct {v2, v6, v6, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    sget-object v3, Landroid/graphics/Region$Op;->UNION:Landroid/graphics/Region$Op;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    goto :goto_0
.end method

.method public drawSubstring(Ljava/lang/String;IIIII)V
    .locals 9
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "anchor"    # I

    .prologue
    const/4 v8, 0x0

    .line 493
    if-gez p2, :cond_0

    .line 494
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 496
    :cond_0
    if-gez p3, :cond_1

    .line 497
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 500
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p3

    if-le p2, v0, :cond_2

    .line 501
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 504
    :cond_2
    if-nez p3, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-ne p2, v0, :cond_3

    .line 505
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/StringIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 507
    :cond_3
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p4, v0

    .line 508
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p5, v0

    .line 510
    invoke-direct {p0, p6}, Lcom/beyond/GraphicBridge;->setTextAnchor(I)V

    .line 512
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v7

    .line 515
    .local v7, "fm":Landroid/graphics/Paint$FontMetricsInt;
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    iget v1, p0, Lcom/beyond/GraphicBridge;->clipX1:I

    iget v2, p0, Lcom/beyond/GraphicBridge;->clipY1:I

    iget v3, p0, Lcom/beyond/GraphicBridge;->clipX2:I

    iget v4, p0, Lcom/beyond/GraphicBridge;->clipY2:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 516
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    add-int v3, p3, p2

    int-to-float v4, p4

    iget v1, v7, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int v1, p5, v1

    add-int/lit8 v1, v1, 0x1

    int-to-float v5, v1

    iget-object v6, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    move-object v1, p1

    move v2, p2

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 517
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v1, Landroid/graphics/Rect;

    iget v2, p0, Lcom/beyond/GraphicBridge;->w:I

    iget v3, p0, Lcom/beyond/GraphicBridge;->h:I

    invoke-direct {v1, v8, v8, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    sget-object v2, Landroid/graphics/Region$Op;->UNION:Landroid/graphics/Region$Op;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 518
    return-void
.end method

.method protected encodeImage(Lcom/beyond/ImageBridge;IIII)[B
    .locals 4
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I

    .prologue
    .line 301
    iget v2, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v2

    .line 302
    iget v2, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v2

    .line 304
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 305
    .local v0, "os":Ljava/io/ByteArrayOutputStream;
    iget-object v2, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-static {v2, p2, p3, p4, p5}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 306
    .local v1, "src":Landroid/graphics/Bitmap;
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x64

    invoke-virtual {v1, v2, v3, v0}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 309
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method protected fillPolygon0([I[I)V
    .locals 5
    .param p1, "x"    # [I
    .param p2, "y"    # [I

    .prologue
    .line 170
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    .line 172
    .local v2, "path":Landroid/graphics/Path;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-lt v0, v3, :cond_0

    .line 175
    iget-object v3, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v3}, Lcom/beyond/GraphicBridge;->getXfermodePaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v1

    .line 176
    .local v1, "lp":Landroid/graphics/Paint;
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 178
    iget-object v3, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v2, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 179
    return-void

    .line 173
    .end local v1    # "lp":Landroid/graphics/Paint;
    :cond_0
    aget v3, p1, v0

    int-to-float v3, v3

    aget v4, p2, v0

    int-to-float v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 172
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected fillRoundRect0(IIIIII)V
    .locals 7
    .param p1, "x"    # I
    .param p2, "y"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "arcWidth"    # I
    .param p6, "arcHeight"    # I

    .prologue
    .line 161
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p1, v1

    .line 162
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p2, v1

    .line 163
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-direct {p0, v1}, Lcom/beyond/GraphicBridge;->getXfermodePaint(Landroid/graphics/Paint;)Landroid/graphics/Paint;

    move-result-object v0

    .line 164
    .local v0, "lp":Landroid/graphics/Paint;
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 165
    iget v1, p0, Lcom/beyond/GraphicBridge;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 166
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    new-instance v2, Landroid/graphics/RectF;

    int-to-float v3, p1

    int-to-float v4, p2

    add-int v5, p1, p3

    int-to-float v5, v5

    add-int v6, p2, p4

    int-to-float v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    int-to-float v3, p5

    int-to-float v4, p6

    invoke-virtual {v1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 167
    return-void
.end method

.method protected getPixel(Lcom/beyond/ImageBridge;II)I
    .locals 1
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 203
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v0

    .line 204
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v0

    .line 206
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p2, p3}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v0

    return v0
.end method

.method protected getPixels(Lcom/beyond/ImageBridge;IIII[BII)V
    .locals 9
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "pixels"    # [B
    .param p7, "offset"    # I
    .param p8, "bpl"    # I

    .prologue
    .line 218
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v0

    .line 219
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v0

    .line 221
    array-length v0, p6

    new-array v1, v0, [I

    .line 222
    .local v1, "ps":[I
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    move/from16 v2, p7

    move/from16 v3, p8

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 223
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v0, v1

    if-lt v8, v0, :cond_0

    .line 225
    return-void

    .line 224
    :cond_0
    aget v0, v1, v8

    int-to-byte v0, v0

    aput-byte v0, p6, v8

    .line 223
    add-int/lit8 v8, v8, 0x1

    goto :goto_0
.end method

.method protected getRGBPixels(Lcom/beyond/ImageBridge;IIII[III)V
    .locals 9
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "pixels"    # [I
    .param p7, "offset"    # I
    .param p8, "bpl"    # I

    .prologue
    .line 229
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v0

    .line 230
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v0

    .line 232
    array-length v0, p6

    new-array v1, v0, [I

    .line 233
    .local v1, "ps":[I
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    move/from16 v2, p7

    move/from16 v3, p8

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 234
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v0, v1

    if-lt v8, v0, :cond_0

    .line 236
    return-void

    .line 235
    :cond_0
    aget v0, v1, v8

    int-to-byte v0, v0

    aput v0, p6, v8

    .line 234
    add-int/lit8 v8, v8, 0x1

    goto :goto_0
.end method

.method public getStrokeStyle()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lcom/beyond/GraphicBridge;->style:I

    return v0
.end method

.method protected init(Lcom/beyond/ImageBridge;Lcom/beyond/ImageBridge;)V
    .locals 3
    .param p1, "img_this"    # Lcom/beyond/ImageBridge;
    .param p2, "img_src"    # Lcom/beyond/ImageBridge;

    .prologue
    .line 57
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    .line 58
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 59
    iget-object v0, p2, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    .line 65
    :goto_0
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->obj_ft:Ljava/lang/Object;

    check-cast v0, Lcom/beyond/FontBridge;

    invoke-virtual {p0, v0}, Lcom/beyond/GraphicBridge;->setFont(Lcom/beyond/FontBridge;)V

    .line 66
    return-void

    .line 63
    :cond_0
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/beyond/GraphicBridge;->g_canvas:Landroid/graphics/Canvas;

    goto :goto_0
.end method

.method public isXORMode()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 78
    iget v1, p0, Lcom/beyond/GraphicBridge;->mode:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAlpha(I)V
    .locals 2
    .param p1, "alpha"    # I

    .prologue
    const/16 v1, 0xff

    .line 590
    if-ltz p1, :cond_0

    if-le p1, v1, :cond_1

    .line 591
    :cond_0
    iput v1, p0, Lcom/beyond/GraphicBridge;->alpha:I

    .line 592
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 598
    :goto_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/beyond/GraphicBridge;->mode:I

    .line 599
    return-void

    .line 595
    :cond_1
    iput p1, p0, Lcom/beyond/GraphicBridge;->alpha:I

    .line 596
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_0
.end method

.method public setColor(I)V
    .locals 2
    .param p1, "rgb"    # I

    .prologue
    .line 521
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/GraphicBridge;->gray:I

    .line 523
    const v0, 0xffffff

    and-int/2addr v0, p1

    iput v0, p0, Lcom/beyond/GraphicBridge;->rgb:I

    .line 526
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    or-int/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 527
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/beyond/GraphicBridge;->alpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 528
    return-void
.end method

.method public setColor(III)V
    .locals 3
    .param p1, "r"    # I
    .param p2, "g"    # I
    .param p3, "b"    # I

    .prologue
    .line 543
    or-int v0, p1, p2

    or-int/2addr v0, p3

    and-int/lit16 v0, v0, -0x100

    if-eqz v0, :cond_0

    .line 544
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 546
    :cond_0
    const/4 v0, -0x1

    iput v0, p0, Lcom/beyond/GraphicBridge;->gray:I

    .line 547
    and-int/lit16 v0, p1, 0xff

    shl-int/lit8 v0, v0, 0x10

    and-int/lit16 v1, p2, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, p3, 0xff

    or-int/2addr v0, v1

    iput v0, p0, Lcom/beyond/GraphicBridge;->rgb:I

    .line 549
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/beyond/GraphicBridge;->rgb:I

    const/high16 v2, -0x1000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 550
    return-void
.end method

.method public setFont(Lcom/beyond/FontBridge;)V
    .locals 3
    .param p1, "ft"    # Lcom/beyond/FontBridge;

    .prologue
    .line 568
    iget-object v1, p1, Lcom/beyond/FontBridge;->font_paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    .line 569
    .local v0, "tf":Landroid/graphics/Typeface;
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Lcom/beyond/FontBridge;->getSize()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/beyond/FontBridge;->getUserDefinedFontSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 570
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 571
    invoke-virtual {p1}, Lcom/beyond/FontBridge;->isUnderlined()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 572
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 575
    :goto_0
    return-void

    .line 574
    :cond_0
    iget-object v1, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    goto :goto_0
.end method

.method public setGrayScale(I)V
    .locals 3
    .param p1, "val"    # I

    .prologue
    .line 578
    if-ltz p1, :cond_0

    const/16 v0, 0xff

    if-le p1, v0, :cond_1

    .line 579
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Gray value out of range"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 582
    :cond_1
    monitor-enter p0

    .line 583
    shl-int/lit8 v0, p1, 0x10

    shl-int/lit8 v1, p1, 0x8

    or-int/2addr v0, v1

    or-int/2addr v0, p1

    :try_start_0
    iput v0, p0, Lcom/beyond/GraphicBridge;->rgb:I

    .line 584
    iput p1, p0, Lcom/beyond/GraphicBridge;->gray:I

    .line 582
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 586
    iget-object v0, p0, Lcom/beyond/GraphicBridge;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/beyond/GraphicBridge;->rgb:I

    const/high16 v2, -0x1000000

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 587
    return-void

    .line 582
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method protected setPixel(Lcom/beyond/ImageBridge;II)V
    .locals 2
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    .line 210
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v0

    .line 211
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v0

    .line 213
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    iget v1, p0, Lcom/beyond/GraphicBridge;->rgb:I

    invoke-virtual {v0, p2, p3, v1}, Landroid/graphics/Bitmap;->setPixel(III)V

    .line 214
    return-void
.end method

.method protected setPixels(Lcom/beyond/ImageBridge;IIII[BII)V
    .locals 11
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "pixels"    # [B
    .param p7, "offset"    # I
    .param p8, "bpl"    # I

    .prologue
    .line 240
    if-nez p6, :cond_0

    .line 241
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v3, "getPixels"

    invoke-direct {v1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 243
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, p4, v1}, Lcom/beyond/GraphicBridge;->fbGetBytesPerLine(II)I

    move-result v10

    .line 245
    .local v10, "length":I
    move/from16 v0, p8

    if-le v10, v0, :cond_1

    .line 246
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 249
    :cond_1
    add-int/lit8 v1, p5, -0x1

    mul-int v1, v1, p8

    add-int/2addr v10, v1

    .line 251
    if-ltz p7, :cond_2

    add-int v1, p7, v10

    move-object/from16 v0, p6

    array-length v3, v0

    if-gt v1, v3, :cond_2

    .line 252
    if-gez v10, :cond_3

    .line 253
    :cond_2
    new-instance v1, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v1

    .line 256
    :cond_3
    iget v1, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v1

    .line 257
    iget v1, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v1

    .line 259
    move-object/from16 v0, p6

    array-length v1, v0

    new-array v2, v1, [I

    .line 260
    .local v2, "ps":[I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    array-length v1, v2

    if-lt v9, v1, :cond_4

    .line 263
    iget-object v1, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    move/from16 v3, p7

    move/from16 v4, p8

    move v5, p2

    move v6, p3

    move v7, p4

    move/from16 v8, p5

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 264
    return-void

    .line 261
    :cond_4
    aget-byte v1, p6, v9

    aput v1, v2, v9

    .line 260
    add-int/lit8 v9, v9, 0x1

    goto :goto_0
.end method

.method protected setRGBPixels(Lcom/beyond/ImageBridge;IIII[III)V
    .locals 9
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "w"    # I
    .param p5, "h"    # I
    .param p6, "pixels"    # [I
    .param p7, "offset"    # I
    .param p8, "bpl"    # I

    .prologue
    .line 268
    if-nez p6, :cond_0

    .line 269
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "getPixels"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 271
    :cond_0
    if-ltz p4, :cond_1

    if-gez p5, :cond_2

    .line 272
    :cond_1
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 275
    :cond_2
    add-int/lit8 v0, p5, -0x1

    shr-int/lit8 v1, p8, 0x2

    mul-int/2addr v0, v1

    add-int v8, v0, p4

    .line 277
    .local v8, "length":I
    if-ltz p7, :cond_3

    add-int v0, p7, v8

    array-length v1, p6

    if-gt v0, v1, :cond_3

    .line 278
    if-gez v8, :cond_4

    .line 279
    :cond_3
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v0

    .line 282
    :cond_4
    iget v0, p0, Lcom/beyond/GraphicBridge;->transX:I

    add-int/2addr p2, v0

    .line 283
    iget v0, p0, Lcom/beyond/GraphicBridge;->transY:I

    add-int/2addr p3, v0

    .line 285
    iget-object v0, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    move-object v1, p6

    move/from16 v2, p7

    move/from16 v3, p8

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 286
    return-void
.end method
