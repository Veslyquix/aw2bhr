	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080747FC
sub_080747FC: @ 0x080747FC
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r0, _08074830 @ =gUnknown_0202FDFC
	movs r6, #1
	adds r4, r0, #0
	adds r4, #0x12
_08074808:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08074820
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	bl sub_08074754
	ldrb r0, [r4]
	orrs r0, r6
	strb r0, [r4]
_08074820:
	adds r4, #1
	adds r5, #1
	cmp r5, #0x29
	ble _08074808
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074830: .4byte gUnknown_0202FDFC

