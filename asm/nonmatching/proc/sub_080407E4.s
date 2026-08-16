	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080407E4
sub_080407E4: @ 0x080407E4
	push {lr}
	adds r3, r0, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _08040818
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #6
	bne _0804080C
	ldr r0, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	movs r2, #3
	rsbs r2, r2, #0
	bl sub_0803FF48
	b _08040878
_0804080C:
	ldr r0, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	adds r2, r3, #0
	bl sub_0803FECC
	b _08040878
_08040818:
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bhi _08040878
	lsls r0, r0, #2
	ldr r1, _08040834 @ =_08040838
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040834: .4byte _08040838
_08040838: @ jump table
	.4byte _0804085C @ case 0
	.4byte _08040878 @ case 1
	.4byte _08040866 @ case 2
	.4byte _0804085C @ case 3
	.4byte _08040870 @ case 4
	.4byte _08040850 @ case 5
_08040850:
	ldr r0, [r3, #0x2c]
	ldr r1, [r3, #0x30]
	adds r2, r3, #0
	bl sub_080402B4
	b _08040878
_0804085C:
	ldr r0, [r3, #0x4c]
	adds r1, r3, #0
	bl sub_08040200
	b _08040878
_08040866:
	ldr r0, [r3, #0x4c]
	adds r1, r3, #0
	bl sub_0804026C
	b _08040878
_08040870:
	ldr r0, [r3, #0x4c]
	adds r1, r3, #0
	bl sub_08040290
_08040878:
	pop {r0}
	bx r0

