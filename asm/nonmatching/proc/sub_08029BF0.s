	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029BF0
sub_08029BF0: @ 0x08029BF0
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	bl sub_08029088
	ldr r1, [r4, #0x24]
	ldr r0, _08029C0C @ =0x000003E7
	cmp r1, r0
	ble _08029C10
	movs r0, #0x32
	b _08029C1A
	.align 2, 0
_08029C0C: .4byte 0x000003E7
_08029C10:
	asrs r0, r1, #4
	str r0, [r4, #0x2c]
	cmp r0, #0
	bne _08029C1C
	movs r0, #1
_08029C1A:
	str r0, [r4, #0x2c]
_08029C1C:
	movs r0, #0x6b
	bl sub_0803B4DC
	pop {r4}
	pop {r0}
	bx r0

