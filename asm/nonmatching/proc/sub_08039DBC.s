	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039DBC
sub_08039DBC: @ 0x08039DBC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	subs r0, #3
	cmp r0, #0x11
	bhi _08039E3A
	lsls r0, r0, #2
	ldr r1, _08039DD4 @ =_08039DD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039DD4: .4byte _08039DD8
_08039DD8: @ jump table
	.4byte _08039E20 @ case 0
	.4byte _08039E3A @ case 1
	.4byte _08039E3A @ case 2
	.4byte _08039E20 @ case 3
	.4byte _08039E3A @ case 4
	.4byte _08039E3A @ case 5
	.4byte _08039E20 @ case 6
	.4byte _08039E3A @ case 7
	.4byte _08039E3A @ case 8
	.4byte _08039E20 @ case 9
	.4byte _08039E3A @ case 10
	.4byte _08039E20 @ case 11
	.4byte _08039E3A @ case 12
	.4byte _08039E20 @ case 13
	.4byte _08039E3A @ case 14
	.4byte _08039E20 @ case 15
	.4byte _08039E3A @ case 16
	.4byte _08039E28 @ case 17
_08039E20:
	ldrh r0, [r4, #0x2c]
	adds r0, #0x10
	strh r0, [r4, #0x2c]
	b _08039E3A
_08039E28:
	ldrh r0, [r4, #0x2c]
	adds r0, #0x10
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r1, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	b _08039E96
_08039E3A:
	adds r5, r4, #0
	adds r5, #0x29
	ldrb r0, [r5]
	lsls r0, r0, #4
	ldr r7, _08039E9C @ =gUnknown_08499590
	ldr r2, [r7]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r6, r4, #0
	adds r6, #0x2a
	ldrb r1, [r6]
	lsls r1, r1, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #0x40
	bl sub_0801306C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08039E90
	ldrb r0, [r5]
	lsls r0, r0, #4
	ldr r2, [r7]
	movs r3, #4
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r0, #8
	ldr r1, _08039EA0 @ =0x000001FF
	ands r0, r1
	ldrb r1, [r6]
	lsls r1, r1, #4
	movs r3, #6
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r1, #8
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08039EA4 @ =gUnknown_0849D81C
	ldrh r3, [r4, #0x2c]
	bl sub_0801BD00
_08039E90:
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
_08039E96:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039E9C: .4byte gUnknown_08499590
_08039EA0: .4byte 0x000001FF
_08039EA4: .4byte gUnknown_0849D81C

