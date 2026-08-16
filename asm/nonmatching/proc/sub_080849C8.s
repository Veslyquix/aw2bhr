	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080849C8
sub_080849C8: @ 0x080849C8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	bl sub_0807898C
	ldr r2, _08084AB8 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #1]
	mov r0, sb
	bl sub_08078D80
	ldr r5, _08084ABC @ =gUnknown_030033EC
	ldrh r1, [r5]
	movs r0, #0
	bl sub_08085950
	ldr r0, _08084AC0 @ =gUnknown_030030B4
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	ldr r1, _08084AC4 @ =0x06006C00
	adds r0, r0, r1
	ldr r6, _08084AC8 @ =gUnknown_08616B1C
	ldrh r2, [r5]
	ldr r1, _08084ACC @ =gUnknown_081D93DC
	mov r8, r1
	ldr r4, [r1]
	ldr r3, [r4]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r1, [r1, #0x1a]
	adds r1, r1, r6
	ldrb r1, [r1]
	movs r2, #0
	bl sub_0802D5A0
	bl sub_080858C0
	ldrh r1, [r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xb6
	lsls r1, r1, #1
	movs r2, #5
	bl sub_08043BA4
	ldrh r1, [r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	ldr r1, _08084AD0 @ =0x06015700
	movs r2, #0x16
	bl sub_08043FA8
	movs r0, #8
	bl sub_08043B44
	ldrh r1, [r5]
	ldr r2, [r4]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	movs r1, #0xab
	lsls r1, r1, #2
	bl sub_08043B14
	bl sub_0801F114
	ldr r4, _08084AD4 @ =0x06010000
	movs r2, #0xb1
	lsls r2, r2, #2
	movs r0, #0
	adds r1, r4, #0
	movs r3, #0x12
	bl sub_0801F150
	movs r2, #0xb3
	lsls r2, r2, #2
	movs r0, #1
	adds r1, r4, #0
	movs r3, #0x13
	bl sub_0801F150
	movs r2, #0xb7
	lsls r2, r2, #2
	movs r0, #2
	adds r1, r4, #0
	movs r3, #0x14
	bl sub_0801F150
	movs r0, #0x13
	bl sub_0801F234
	movs r0, #0x14
	bl sub_0801F234
	movs r4, #0
	mov r6, r8
	ldr r5, _08084AD8 @ =gUnknown_081D93E0
	ldr r7, _08084ADC @ =gUnknown_081D93E4
	ldr r0, _08084AE0 @ =gUnknown_081D93E8
	mov r8, r0
	b _08084AFC
	.align 2, 0
_08084AB8: .4byte gDispIo
_08084ABC: .4byte gUnknown_030033EC
_08084AC0: .4byte gUnknown_030030B4
_08084AC4: .4byte 0x06006C00
_08084AC8: .4byte gUnknown_08616B1C
_08084ACC: .4byte gUnknown_081D93DC
_08084AD0: .4byte 0x06015700
_08084AD4: .4byte 0x06010000
_08084AD8: .4byte gUnknown_081D93E0
_08084ADC: .4byte gUnknown_081D93E4
_08084AE0: .4byte gUnknown_081D93E8
_08084AE4:
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x56
	ldrb r0, [r0]
	adds r0, #0x3d
	bl sub_0801F234
	adds r4, #1
_08084AFC:
	ldr r1, [r5]
	ldrb r0, [r1, #1]
	cmp r0, #2
	bne _08084B0C
	ldrb r0, [r1, #2]
	bl sub_0802490C
	b _08084B10
_08084B0C:
	bl sub_080248F8
_08084B10:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08084AE4
	movs r0, #0x9b
	bl sub_0801F234
	movs r0, #0x9c
	bl sub_0801F234
	movs r0, #0x9d
	bl sub_0801F234
	movs r0, #0x9e
	bl sub_0801F234
	movs r0, #0x9f
	bl sub_0801F234
	movs r0, #0xa0
	bl sub_0801F234
	movs r0, #0xa1
	bl sub_0801F234
	movs r0, #0xa2
	bl sub_0801F234
	movs r0, #0xa3
	bl sub_0801F234
	movs r0, #0xa4
	bl sub_0801F234
	movs r0, #0xa5
	bl sub_0801F234
	movs r0, #0xa6
	bl sub_0801F234
	movs r0, #0xa7
	bl sub_0801F234
	movs r0, #0x93
	bl sub_0801F234
	movs r0, #0x94
	bl sub_0801F234
	movs r0, #0x43
	bl sub_0801F234
	movs r0, #0x44
	bl sub_0801F234
	movs r0, #0x50
	bl sub_0801F234
	movs r0, #0x95
	bl sub_0801F234
	movs r0, #0x96
	bl sub_0801F234
	movs r0, #0x97
	bl sub_0801F234
	movs r0, #0x98
	bl sub_0801F234
	movs r0, #0x99
	bl sub_0801F234
	movs r0, #0x9a
	bl sub_0801F234
	movs r0, #0x67
	bl sub_0801F234
	movs r0, #0x92
	bl sub_0801F234
	ldr r0, [r7]
	mov r1, sb
	bl Proc_Start
	mov r1, r8
	ldr r0, [r1]
	bl sub_08011B34
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

