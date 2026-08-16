	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063994
sub_08063994: @ 0x08063994
	push {lr}
	sub sp, #0x14
	movs r0, #0xf0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp, #4]
	add r1, sp, #8
	movs r2, #0
	movs r0, #0x78
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x50
	strh r0, [r1]
	add r0, sp, #0xc
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	add r0, sp, #0x10
	strh r2, [r0]
	ldr r1, _080639DC @ =gUnknown_030024D0
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	ldr r1, _080639E0 @ =gUnknown_03003020
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_080639DC: .4byte gUnknown_030024D0
_080639E0: .4byte gUnknown_03003020

