	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08002844
sub_08002844: @ 0x08002844
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	mov sb, r1
	mov r8, r2
	adds r7, r3, #0
	ldr r0, _080028C4 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	adds r0, #0x2f
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	bne _08002864
	movs r5, #1
_08002864:
	movs r0, #0x3f
	ands r7, r0
	cmp r7, #0x19
	beq _080028DC
	lsls r6, r4, #2
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _080028A0
	bl sub_08026190
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_080261A4
	ldr r2, _080028C8 @ =0x000003FF
	ands r0, r2
	lsls r0, r0, #5
	adds r4, r4, r0
	ldr r0, _080028CC @ =gUnknown_08485D20
	adds r0, r6, r0
	ldr r1, [r0]
	ands r1, r2
	lsls r1, r1, #5
	ldr r0, _080028D0 @ =0x06010000
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x80
	bl sub_08011E54
_080028A0:
	ldr r2, _080028D4 @ =gUnknown_0810E6E0
	ldr r0, _080028D8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	b _080028FA
	.align 2, 0
_080028C4: .4byte gUnknown_0200B0B0
_080028C8: .4byte 0x000003FF
_080028CC: .4byte gUnknown_08485D20
_080028D0: .4byte 0x06010000
_080028D4: .4byte gUnknown_0810E6E0
_080028D8: .4byte gUnknown_08499598
_080028DC:
	ldr r1, _08002950 @ =0x06010000
	ldr r0, _08002954 @ =gUnknown_08485D20
	lsls r4, r4, #2
	adds r0, r4, r0
	ldr r2, [r0]
	movs r0, #0x12
	bl sub_0801F19C
	ldr r0, _08002958 @ =gUnknown_081268D8
	movs r1, #0xf0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r6, r4, #0
_080028FA:
	movs r0, #8
	add r8, r0
	ldr r4, _0800295C @ =0x000001FF
	mov r0, sb
	ands r4, r0
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _08002910
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r4, r0
_08002910:
	mov r1, r8
	adds r1, #8
	movs r0, #0xff
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0800292A
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
_0800292A:
	ldr r0, _08002960 @ =gUnknown_08485D44
	adds r0, r6, r0
	ldr r2, [r0]
	movs r3, #0xe0
	lsls r3, r3, #8
	cmp r7, #0x19
	beq _0800293C
	movs r0, #6
	lsls r3, r0, #0xc
_0800293C:
	adds r0, r4, #0
	bl sub_0801BD00
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002950: .4byte 0x06010000
_08002954: .4byte gUnknown_08485D20
_08002958: .4byte gUnknown_081268D8
_0800295C: .4byte 0x000001FF
_08002960: .4byte gUnknown_08485D44

