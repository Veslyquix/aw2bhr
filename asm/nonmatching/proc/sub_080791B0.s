	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080791B0
sub_080791B0: @ 0x080791B0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	bl sub_08071B88
	ldr r0, _080793E8 @ =gUnknown_0822AA80
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0xc0
	bl sub_08013618
	bl sub_0807A908
	ldr r1, _080793EC @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	adds r1, #0x33
	ldrb r1, [r1]
	adds r4, #0x52
	movs r0, #5
	subs r0, r0, r1
	strh r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080791F0
	movs r0, #3
	strh r0, [r4]
_080791F0:
	adds r7, r4, #0
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	mov r8, r0
	ldr r6, _080793F4 @ =0x06014800
	movs r5, #0x80
	lsls r5, r5, #2
	movs r4, #7
_080791FE:
	ldrh r0, [r7]
	lsls r0, r0, #3
	adds r0, r0, r5
	lsls r0, r0, #5
	add r0, r8
	adds r1, r6, #0
	movs r2, #0x40
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #1
	adds r6, r6, r1
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080791FE
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _080793F8 @ =0x06015040
	mov r8, r1
	movs r1, #0x90
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _080793FC @ =0x06015000
	movs r1, #0x80
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #9
_08079234:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r7, #0x40
	adds r6, #0x80
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _08079234
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _08079400 @ =0x06015540
	mov r8, r1
	movs r1, #0x9a
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _08079404 @ =0x06015500
	movs r1, #0x8a
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #5
_0807926E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r7, #0x40
	adds r6, #0x80
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _0807926E
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _08079408 @ =0x06015840
	mov r8, r1
	movs r1, #0xb0
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _0807940C @ =0x06015800
	movs r1, #0xa0
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #3
_080792A8:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x10
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	bl CpuFastSet
	movs r0, #0x80
	add r8, r0
	adds r7, #0x40
	adds r6, #0x80
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080792A8
	ldr r4, _08079410 @ =gUnknown_02013750
	ldr r1, _08079414 @ =0x06015A00
	adds r0, r4, #0
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r4, r1
	ldr r1, _08079418 @ =0x06015A80
	movs r2, #0x20
	bl CpuFastSet
	ldr r1, _0807941C @ =0xFFFFF080
	adds r0, r4, r1
	ldr r1, _08079420 @ =0x06015F80
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, _08079424 @ =0x06016080
	mov r8, r0
	ldr r1, _08079428 @ =0xFFFFF900
	adds r6, r4, r1
	ldr r7, _0807942C @ =0x06016000
	ldr r0, _08079430 @ =0xFFFFF500
	adds r5, r4, r0
	movs r4, #1
_08079302:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r6, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r1, #0x80
	lsls r1, r1, #1
	add r8, r1
	adds r6, #0x80
	adds r7, r7, r1
	adds r5, #0x80
	subs r4, #1
	cmp r4, #0
	bge _08079302
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _08079434 @ =0x06016280
	mov r8, r1
	movs r1, #0xd4
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _08079438 @ =0x06016200
	movs r1, #0xc4
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #1
_0807933E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r7, #0x80
	adds r6, r6, r0
	adds r5, #0x80
	subs r4, #1
	cmp r4, #0
	bge _0807933E
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _0807943C @ =0x06016480
	mov r8, r1
	movs r1, #0xd8
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _08079440 @ =0x06016400
	movs r1, #0xc8
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #1
_0807937A:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r7, #0x80
	adds r6, r6, r0
	adds r5, #0x80
	subs r4, #1
	cmp r4, #0
	bge _0807937A
	ldr r0, _080793F0 @ =gUnknown_0200FC50
	ldr r1, _08079444 @ =0x06016680
	mov r8, r1
	movs r1, #0xf0
	lsls r1, r1, #6
	adds r7, r0, r1
	ldr r6, _08079448 @ =0x06016600
	movs r1, #0xe0
	lsls r1, r1, #6
	adds r5, r0, r1
	movs r4, #1
_080793B6:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #0x80
	lsls r0, r0, #1
	add r8, r0
	adds r7, #0x80
	adds r6, r6, r0
	adds r5, #0x80
	subs r4, #1
	cmp r4, #0
	bge _080793B6
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080793E8: .4byte gUnknown_0822AA80
_080793EC: .4byte gUnknown_08499598
_080793F0: .4byte gUnknown_0200FC50
_080793F4: .4byte 0x06014800
_080793F8: .4byte 0x06015040
_080793FC: .4byte 0x06015000
_08079400: .4byte 0x06015540
_08079404: .4byte 0x06015500
_08079408: .4byte 0x06015840
_0807940C: .4byte 0x06015800
_08079410: .4byte gUnknown_02013750
_08079414: .4byte 0x06015A00
_08079418: .4byte 0x06015A80
_0807941C: .4byte 0xFFFFF080
_08079420: .4byte 0x06015F80
_08079424: .4byte 0x06016080
_08079428: .4byte 0xFFFFF900
_0807942C: .4byte 0x06016000
_08079430: .4byte 0xFFFFF500
_08079434: .4byte 0x06016280
_08079438: .4byte 0x06016200
_0807943C: .4byte 0x06016480
_08079440: .4byte 0x06016400
_08079444: .4byte 0x06016680
_08079448: .4byte 0x06016600

