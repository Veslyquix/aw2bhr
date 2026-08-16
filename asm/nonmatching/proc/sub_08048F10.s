	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048F10
sub_08048F10: @ 0x08048F10
	push {r4, lr}
	ldr r1, _08048F2C @ =gUnknown_0812A154
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r3, _08048F30 @ =0x00000832
	adds r2, r0, r3
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	bge _08048F34
	adds r0, r3, #0
	adds r0, #8
	b _08048F36
	.align 2, 0
_08048F2C: .4byte gUnknown_0812A154
_08048F30: .4byte 0x00000832
_08048F34:
	movs r0, #0
_08048F36:
	strh r0, [r2]
	ldr r0, [r1]
	ldr r0, [r0]
	ldr r1, _08048F48 @ =0x00000832
	adds r0, r0, r1
	ldrh r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08048F48: .4byte 0x00000832

