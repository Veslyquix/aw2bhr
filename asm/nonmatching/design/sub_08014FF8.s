	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014FF8
sub_08014FF8: @ 0x08014FF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov ip, r0
	adds r6, r1, #0
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r0, _08015034 @ =gUnknown_0808E530
	ldr r1, [r0]
	ldr r2, [r1]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r2, r1
	bne _0801501E
	b _08015144
_0801501E:
	cmp r6, #0
	bne _08015024
	b _08015144
_08015024:
	mov r1, ip
	cmp r1, #0x10
	bgt _08015038
	adds r0, r6, #0
	bl sub_08014E44
	b _08015146
	.align 2, 0
_08015034: .4byte gUnknown_0808E530
_08015038:
	adds r6, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r6, r0
	movs r3, #0
	mov sb, r3
	mov sl, r3
	mov r0, ip
	rsbs r0, r0, #0
	str r0, [sp]
_0801504C:
	ldr r0, [r2, #8]
	ldr r5, [r2]
	cmp r0, #0
	bne _08015086
	mov r0, ip
	adds r0, #0xf
	adds r3, r2, r0
	ldr r1, [sp]
	ands r3, r1
	adds r0, r2, #0
	adds r0, #0x10
	cmp r3, r0
	blo _08015086
	adds r1, r3, r6
	ldr r4, [r2, #4]
	adds r0, r2, r4
	cmp r1, r0
	bhs _08015086
	cmp sb, r4
	bhi _0801507A
	mov r0, sb
	cmp r0, #0
	bne _08015086
_0801507A:
	adds r7, r3, #0
	mov r8, r2
	mov sb, r4
	ldr r1, [r2]
	mov sl, r1
	mov r5, sl
_08015086:
	cmp r5, #0
	beq _0801508E
	adds r2, r5, #0
	b _0801504C
_0801508E:
	mov r3, sb
	cmp r3, #0
	beq _08015144
	ldr r0, _080150BC @ =gUnknown_03000050
	ldr r2, [r0]
	cmp r8, r2
	beq _080150E4
	mov r0, r8
	subs r1, r7, r0
	cmp r1, #0x20
	bgt _080150DA
	asrs r0, r1, #2
	adds r5, r7, #0
	subs r5, #0x10
	adds r1, r6, #0
	adds r1, #0x20
	adds r3, r7, #0
	subs r3, #0xc
	adds r4, r7, #0
	subs r4, #8
	cmp r0, #0xf
	ble _08015108
	b _080150C2
	.align 2, 0
_080150BC: .4byte gUnknown_03000050
_080150C0:
	ldr r2, [r2]
_080150C2:
	ldr r0, [r2]
	cmp r0, #0
	beq _08015108
	cmp r0, r8
	bne _080150C0
	adds r0, r7, #0
	subs r0, #0x40
	str r0, [r2]
	ldr r0, [r2, #4]
	adds r0, #0x10
	str r0, [r2, #4]
	b _08015108
_080150DA:
	mov r2, r8
	adds r0, r7, #0
	subs r0, #0x10
	str r0, [r2]
	b _080150F2
_080150E4:
	mov r2, r8
	adds r0, r7, #0
	subs r0, #0x10
	str r0, [r2]
	subs r1, r7, r2
	asrs r1, r1, #2
	lsls r1, r1, #2
_080150F2:
	subs r1, #0x20
	str r1, [r2, #4]
	movs r1, #0
	str r1, [r2, #8]
	adds r5, r0, #0
	adds r1, r6, #0
	adds r1, #0x20
	adds r3, r7, #0
	subs r3, #0xc
	adds r4, r7, #0
	subs r4, #8
_08015108:
	cmp sb, r1
	blo _08015132
	adds r1, r7, r6
	str r1, [r5]
	str r6, [r3]
	movs r0, #1
	str r0, [r4]
	adds r2, r1, #0
	mov r1, sl
	str r1, [r2]
	mov r3, sb
	subs r1, r3, r6
	mov r3, r8
	subs r0, r7, r3
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r1, r1, r0
	str r1, [r2, #4]
	movs r0, #0
	str r0, [r2, #8]
	b _08015140
_08015132:
	mov r0, sl
	str r0, [r5]
	subs r0, r0, r7
	asrs r0, r0, #2
	str r0, [r3]
	movs r0, #1
	str r0, [r4]
_08015140:
	adds r0, r7, #0
	b _08015146
_08015144:
	movs r0, #0
_08015146:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

