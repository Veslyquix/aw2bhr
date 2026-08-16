	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074BDC
sub_08074BDC: @ 0x08074BDC
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08074C18 @ =gUnknown_081CC4D8
	ldr r1, [r0]
	movs r4, #0
	ldrsh r2, [r1, r4]
	adds r1, r2, #0
	adds r1, #0x50
	cmp r1, r3
	ble _08074BFA
	adds r2, r3, #0
	subs r2, #0x50
	cmp r2, #0
	bge _08074BFA
	movs r2, #0
_08074BFA:
	ldr r0, [r0]
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0xa0
	cmp r0, r3
	bge _08074C10
	adds r2, r3, #0
	subs r2, #0x50
	cmp r2, #0xc0
	ble _08074C10
	movs r2, #0xc0
_08074C10:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08074C18: .4byte gUnknown_081CC4D8

