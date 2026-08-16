	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080790D0
sub_080790D0: @ 0x080790D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0807918C @ =gUnknown_08227F3C
	ldr r4, _08079190 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl sub_08011CAC
	movs r7, #0
	mov r8, r4
	movs r3, #0
_080790E8:
	lsls r0, r7, #0xb
	mov r1, r8
	adds r5, r3, r1
	movs r6, #7
	ldr r1, _08079194 @ =0x06012800
	adds r4, r0, r1
_080790F4:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x40
	str r3, [sp]
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	adds r4, r4, r0
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r5, r1
	subs r6, #1
	ldr r3, [sp]
	cmp r6, #0
	bge _080790F4
	adds r3, r3, r0
	adds r7, #1
	cmp r7, #3
	ble _080790E8
	ldr r0, _08079190 @ =gUnknown_0200FC50
	ldr r1, _08079198 @ =0x06015B80
	mov r8, r1
	movs r1, #0xb5
	lsls r1, r1, #6
	adds r6, r0, r1
	ldr r5, _0807919C @ =0x06015B00
	movs r1, #0xa5
	lsls r1, r1, #6
	adds r4, r0, r1
	movs r7, #3
_08079132:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r6, #0x80
	adds r5, r5, r0
	adds r4, #0x80
	subs r7, #1
	cmp r7, #0
	bge _08079132
	ldr r4, _080791A0 @ =gUnknown_02012790
	ldr r1, _080791A4 @ =0x06015F00
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r4, r4, r1
	ldr r1, _080791A8 @ =0x06015F40
	adds r0, r4, #0
	movs r2, #0x10
	bl CpuFastSet
	ldr r0, _080791AC @ =gUnknown_0822AA80
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_08013618
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807918C: .4byte gUnknown_08227F3C
_08079190: .4byte gUnknown_0200FC50
_08079194: .4byte 0x06012800
_08079198: .4byte 0x06015B80
_0807919C: .4byte 0x06015B00
_080791A0: .4byte gUnknown_02012790
_080791A4: .4byte 0x06015F00
_080791A8: .4byte 0x06015F40
_080791AC: .4byte gUnknown_0822AA80

