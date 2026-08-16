	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080499F8
sub_080499F8: @ 0x080499F8
	push {r4, r5, lr}
	sub sp, #4
	ldr r2, _08049AE4 @ =gUnknown_084C30FC
	ldr r3, _08049AE8 @ =0x00006CEB
	movs r0, #0x7f
	movs r1, #0
	bl sub_0801BD00
	ldr r4, _08049AEC @ =gUnknown_084C30F8
	ldr r0, [r4]
	ldr r1, _08049AF0 @ =0x00000832
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x18
	ldr r1, _08049AF4 @ =0x000001FF
	ands r0, r1
	ldr r2, _08049AF8 @ =0x000060AB
	movs r1, #0xa0
	movs r3, #0
	bl sub_08043FD8
	ldr r1, [r4]
	ldrh r0, [r1, #0x28]
	ldr r5, _08049AFC @ =0x00000835
	adds r1, r1, r5
	ldrb r3, [r1]
	movs r1, #0xc0
	lsls r1, r1, #6
	str r1, [sp]
	movs r1, #0xe
	movs r2, #4
	bl sub_08049944
	ldr r0, [r4]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _08049A4E
	movs r0, #0
	strb r0, [r1]
	bl sub_08013AEC
_08049A4E:
	movs r0, #0
	str r0, [sp]
	movs r0, #0x51
	movs r1, #4
	movs r2, #0x20
	movs r3, #0
	bl sub_0801F34C
	ldr r5, _08049B00 @ =gUnknown_0848B6C6
	ldr r4, _08049B04 @ =0x00008C9B
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x1c
	adds r3, r5, #0
	bl sub_0801BEBC
	str r4, [sp]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0x1c
	adds r3, r5, #0
	bl sub_0801BEBC
	str r4, [sp]
	movs r0, #1
	movs r1, #0x40
	movs r2, #0x1c
	adds r3, r5, #0
	bl sub_0801BEBC
	ldr r0, _08049B08 @ =0x00008CA3
	str r0, [sp]
	movs r0, #1
	movs r1, #0x60
	movs r2, #0x1c
	adds r3, r5, #0
	bl sub_0801BEBC
	ldr r5, _08049B0C @ =gUnknown_0848B6BE
	adds r4, #4
	str r4, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0x2c
	adds r3, r5, #0
	bl sub_0801BEBC
	str r4, [sp]
	movs r0, #1
	movs r1, #0x20
	movs r2, #0x2c
	adds r3, r5, #0
	bl sub_0801BEBC
	str r4, [sp]
	movs r0, #1
	movs r1, #0x40
	movs r2, #0x2c
	adds r3, r5, #0
	bl sub_0801BEBC
	ldr r0, _08049B10 @ =0x00008CA7
	str r0, [sp]
	movs r0, #1
	movs r1, #0x60
	movs r2, #0x2c
	adds r3, r5, #0
	bl sub_0801BEBC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08049AE4: .4byte gUnknown_084C30FC
_08049AE8: .4byte 0x00006CEB
_08049AEC: .4byte gUnknown_084C30F8
_08049AF0: .4byte 0x00000832
_08049AF4: .4byte 0x000001FF
_08049AF8: .4byte 0x000060AB
_08049AFC: .4byte 0x00000835
_08049B00: .4byte gUnknown_0848B6C6
_08049B04: .4byte 0x00008C9B
_08049B08: .4byte 0x00008CA3
_08049B0C: .4byte gUnknown_0848B6BE
_08049B10: .4byte 0x00008CA7

