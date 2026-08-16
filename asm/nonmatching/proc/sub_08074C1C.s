	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074C1C
sub_08074C1C: @ 0x08074C1C
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08074C58 @ =gUnknown_081CC4DC
	ldr r1, [r0]
	movs r4, #2
	ldrsh r2, [r1, r4]
	adds r1, r2, #0
	adds r1, #0x28
	cmp r1, r3
	ble _08074C3A
	adds r2, r3, #0
	subs r2, #0x28
	cmp r2, #0
	bge _08074C3A
	movs r2, #0
_08074C3A:
	ldr r0, [r0]
	movs r1, #2
	ldrsh r0, [r0, r1]
	adds r0, #0x78
	cmp r0, r3
	bge _08074C50
	adds r2, r3, #0
	subs r2, #0x28
	cmp r2, #0x60
	ble _08074C50
	movs r2, #0x60
_08074C50:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08074C58: .4byte gUnknown_081CC4DC

