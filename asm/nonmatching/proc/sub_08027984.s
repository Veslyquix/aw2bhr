	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027984
sub_08027984: @ 0x08027984
	push {r4, r5, lr}
	ldr r5, _080279FC @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_080157D0
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	ldr r2, _08027A00 @ =0xFFF00000
	adds r1, r1, r2
	asrs r1, r1, #0x10
	bl sub_080157A4
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08015820
	adds r1, r0, #0
	lsls r1, r1, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	ldr r2, _08027A00 @ =0xFFF00000
	adds r1, r1, r2
	asrs r1, r1, #0x10
	bl sub_080157F4
	movs r1, #0
	ldrsh r0, [r5, r1]
	bl sub_08015900
	adds r4, r0, #0
	lsls r4, r4, #0x10
	movs r2, #0
	ldrsh r0, [r5, r2]
	ldr r1, _08027A04 @ =0xFFFE0000
	adds r4, r4, r1
	asrs r4, r4, #0x10
	adds r1, r4, #0
	bl sub_080158D4
	cmp r4, #0
	bne _080279F4
	movs r2, #0
	ldrsh r0, [r5, r2]
	bl sub_08016974
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r1, #1
	bl sub_080156FC
	ldrb r0, [r5]
	bl sub_08015C30
_080279F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080279FC: .4byte gUnknown_03001FBC
_08027A00: .4byte 0xFFF00000
_08027A04: .4byte 0xFFFE0000

