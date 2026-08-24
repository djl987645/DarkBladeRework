.class public Lcom/beyond/FrameFlusher;
.super Ljava/lang/Object;
.implements Ljava/lang/Runnable;
.source "FrameFlusher.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    :loop_start

    # 33ms 대기 (30fps)
    :try_start_0
    const-wide/16 v0, 0x21

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :sleep_done

    :catch_0
    move-exception v0

    :sleep_done

    # SurfaceHolder/버퍼/Bitmap 준비 확인
    :try_start_1
    sget-object v0, Lcom/beyond/AppThread;->sHolder:Landroid/view/SurfaceHolder;

    if-eqz v0, :loop_start

    sget-object v1, Lcom/beyond/AppThread;->sFrameBuf:Ljava/nio/ByteBuffer;

    if-eqz v1, :loop_start

    sget-object v2, Lcom/beyond/AppThread;->sFrameBitmap:Landroid/graphics/Bitmap;

    if-eqz v2, :loop_start

    # LITTLE_ENDIAN 설정 (XGraphics는 ARM LE로 픽셀 기록)
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    # lockCanvas
    invoke-interface {v0}, Landroid/view/SurfaceHolder;->lockCanvas()Landroid/graphics/Canvas;

    move-result-object v3

    if-eqz v3, :loop_start

    # 버퍼 → Bitmap
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    check-cast v1, Ljava/nio/Buffer;

    invoke-virtual {v2, v1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    # Bitmap → Canvas
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v3, v2, v4, v5, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    # unlock
    invoke-interface {v0, v3}, Landroid/view/SurfaceHolder;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :loop_start

    :catch_1
    move-exception v0

    goto :loop_start
.end method
