	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080633E4
sub_080633E4: @ 0x080633E4
	push {r4, lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _08063410 @ =0x04000128
	ldrh r0, [r3]
	movs r4, #0x8c
	ands r4, r0
	cmp r4, #8
	bne _0806341C
	ldr r0, _08063414 @ =0x0400012A
	strh r1, [r0]
	ldr r1, _08063418 @ =0x00002083
	adds r0, r1, #0
	strh r0, [r3]
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	b _08063428
	.align 2, 0
_08063410: .4byte 0x04000128
_08063414: .4byte 0x0400012A
_08063418: .4byte 0x00002083
_0806341C:
	adds r0, r2, #0
	bl sub_08062FB8
	movs r0, #8
	eors r4, r0
	adds r0, r4, #0
_08063428:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

