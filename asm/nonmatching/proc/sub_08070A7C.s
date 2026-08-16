	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08070A7C
sub_08070A7C: @ 0x08070A7C
	push {lr}
	sub sp, #4
	ldr r0, _08070ADC @ =gUnknown_03007FF0
	ldr r2, [r0]
	ldr r1, [r2]
	ldr r3, _08070AE0 @ =0x978C92AD
	adds r0, r1, r3
	cmp r0, #1
	bhi _08070AD4
	adds r0, r1, #0
	adds r0, #0xa
	str r0, [r2]
	ldr r1, _08070AE4 @ =0x040000C4
	ldr r0, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x12
	ands r0, r3
	cmp r0, #0
	beq _08070AA6
	ldr r0, _08070AE8 @ =0x84400004
	str r0, [r1]
_08070AA6:
	ldr r1, _08070AEC @ =0x040000D0
	ldr r0, [r1]
	ands r0, r3
	cmp r0, #0
	beq _08070AB4
	ldr r0, _08070AE8 @ =0x84400004
	str r0, [r1]
_08070AB4:
	ldr r0, _08070AF0 @ =0x040000C6
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r2, _08070AF4 @ =0x05000318
	mov r0, sp
	bl CpuSet
_08070AD4:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08070ADC: .4byte gUnknown_03007FF0
_08070AE0: .4byte 0x978C92AD
_08070AE4: .4byte 0x040000C4
_08070AE8: .4byte 0x84400004
_08070AEC: .4byte 0x040000D0
_08070AF0: .4byte 0x040000C6
_08070AF4: .4byte 0x05000318

