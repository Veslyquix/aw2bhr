	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080771C0
sub_080771C0: @ 0x080771C0
	push {lr}
	ldr r2, _080771E0 @ =0x04000012
	ldr r0, _080771E4 @ =gUnknown_0300064C
	ldr r1, [r0]
	strh r1, [r2]
	ldr r0, _080771E8 @ =0x0400001A
	strh r1, [r0]
	movs r0, #0
	bl sub_08063980
	ldr r0, _080771EC @ =sub_080771F0
	bl sub_080638D0
	pop {r0}
	bx r0
	.align 2, 0
_080771E0: .4byte 0x04000012
_080771E4: .4byte gUnknown_0300064C
_080771E8: .4byte 0x0400001A
_080771EC: .4byte sub_080771F0

