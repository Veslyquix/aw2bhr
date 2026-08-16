	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C46C
sub_0807C46C: @ 0x0807C46C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r3, _0807C49C @ =gUnknown_08615C62
	movs r0, #0
	str r0, [sp]
	movs r1, #0x68
	movs r2, #8
	bl sub_0801BEBC
	bl sub_0803840C
	adds r4, r0, #0
	cmp r4, #9
	bgt _0807C4A4
	ldr r3, _0807C4A0 @ =gUnknown_0848B690
	lsls r0, r4, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xca
	movs r2, #8
	bl sub_0801BEBC
	b _0807C526
	.align 2, 0
_0807C49C: .4byte gUnknown_08615C62
_0807C4A0: .4byte gUnknown_0848B690
_0807C4A4:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	lsls r0, r0, #2
	adds r0, #0x1c
	ldr r5, _0807C4E0 @ =gUnknown_0848B690
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc8
	movs r2, #8
	adds r3, r5, #0
	bl sub_0801BEBC
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	cmp r0, #1
	bne _0807C4E4
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd2
	b _0807C502
	.align 2, 0
_0807C4E0: .4byte gUnknown_0848B690
_0807C4E4:
	adds r0, r4, #0
	movs r1, #0xa
	bl Div
	cmp r0, #7
	bne _0807C50C
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd5
_0807C502:
	movs r2, #8
	adds r3, r5, #0
	bl sub_0801BEBC
	b _0807C526
_0807C50C:
	adds r0, r4, #0
	movs r1, #0xa
	bl DivRem
	lsls r0, r0, #2
	adds r0, #0x1c
	str r0, [sp]
	movs r0, #0
	movs r1, #0xd6
	movs r2, #8
	adds r3, r5, #0
	bl sub_0801BEBC
_0807C526:
	movs r5, #0
	ldr r7, _0807C558 @ =gUnknown_0848B6BE
	movs r6, #0x18
_0807C52C:
	lsls r4, r5, #5
	str r6, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r7, #0
	bl sub_0801BEBC
	str r6, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x32
	adds r3, r7, #0
	bl sub_0801BEBC
	adds r5, #1
	cmp r5, #7
	ble _0807C52C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C558: .4byte gUnknown_0848B6BE

